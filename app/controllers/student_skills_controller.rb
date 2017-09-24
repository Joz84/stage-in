class StudentSkillsController < ApplicationController

  def create
    @skill = Skill.find(params[:skill_id])
    @skill.student_skills.create(student: current_user, score: params[:score])
    skills_count = StudentSkill.where(student: current_user).size + 1
    redirect_to skills_count < 6 ? Skill.find(skills_count) : hirings_path
  end

  private

  def student_skill_params
    params.permit(:score)
  end

end
