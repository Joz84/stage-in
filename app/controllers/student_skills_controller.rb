class StudentSkillsController < ApplicationController

  def create
    @skill = Skill.find(params[:skill_id])
    @skill.student_skills.create(student: current_user, score: params[:score])
    skills_count = StudentSkill.where(student: current_user).size.to_i
    @skills = Skill.all
    redirect_to skills_count < @skills.size ? @skills[skills_count] : hirings_path
  end

  private

  def student_skill_params
    params.permit(:score)
  end

end
