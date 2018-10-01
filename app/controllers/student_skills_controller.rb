class StudentSkillsController < ApplicationController

  def create
    @skill = Skill.find(params[:skill_id])
    @student_skill = @skill.student_skills.find_or_create_by(student: current_user)
    @student_skill.update(score: params[:score])
    @skills = Skill.all
    skills_count = @skills.index(@skill)
    # skills_count = StudentSkill.where(student: current_user).size.to_i
    redirect_to skills_count < (@skills.size - 1) ? @skills[skills_count + 1] : hirings_path
  end

  private

  def student_skill_params
    params.permit(:score)
  end

end
