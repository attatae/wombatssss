class ProfilesController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  #added destroy to above, not in Treebook

def index
 if params[:interest]
  @profiles = Profile.tagged_with(params[:interest], :on => :interests)
 elsif params[:skill]
  @profiles = Profile.tagged_with(params[:skill], :on => :skills)
 else
  @profiles = Profile.all
 end
end

   #deleting the s on the end of these makes interests scope all, yet skills scope to none. hmmm...
  
  def new # diff between new and create?
    @profile = Profile.new
  end

  def create #save our new profile to a database
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to @profile 
    else
      render 'new'
    end
  end

  #def show
  #  @user = User.find_by_profile_name(params[:id])
  #  if @user
  #    @profiles = Profile.all 
  #    #@profiles = @user.profiles.all
  #    #gets undefined method 'profiles' for #<User:0x5760630>    
  #    render action: :show
  #  else
  #    render file: 'public/404', profile: 404, formats: [:html]
  #  end
  #end

  def show
    @profile = Profile.find(params[:id])
  end


  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      redirect_to @profile
    else
      render 'edit'
    end
  end

  def destroy
    @profile = Profile.find(params[:id])

    @profile.destroy

    redirect_to profiles_path
  end

    
  private
    def profile_params
      params.require(:profile).permit(:profile_name, :about, :interest_list, :skill_list)
    end
end

