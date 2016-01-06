class AnnouncementsController < ApplicationController
  def new
    if is_instructor?
      @announcement = current_user.announcements.new
    else
      redirect_to class_announcement_path
    end
  end

  def show
    @announcement = Announcement.find(params[:id])
    @announcement.view += 1;
    @announcement.save
  end

  def create
    if is_instructor?
      @announcement = current_user.announcements.create(announcement_params)
      if @announcement.save
        redirect_to announcement_path(@announcement)
      else
        render 'new'
      end
    end
  end

  def index
    @announcements = Announcement.all.paginate(page: params[:page], per_page: 10)
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    @announcement = Announcement.find(params[:id])
    if is_owner?(@announcement)
      if @announcement.update(announcement_params)
        redirect_to announcement_path(@announcement)
      else
        render 'edit'
      end
    else
      redirect_to announcement_path(@announcement)
    end
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    if is_owner?(@announcement)
      @announcement.destroy
      redirect_to class_announcement_path
    else
      redirect_to announcement_path(@announcement)
    end
  end

  private
  def announcement_params
    params.require(:announcement).permit(:title,:content)
  end
end
