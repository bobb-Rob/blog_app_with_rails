require 'rails_helper'

RSpec.describe 'Posts index' , type: :feature do
    before :each do
        @user = User.create(name: "Robertson Arthur", photo:"https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60", bio: "Rails developer")
        @first_post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
        5.times do |_i|
            Comment.create(post: @first_post, author: @user, text: 'Hi Lilly!')
        end

    end
    it 'displays users profile picture' do
         visit user_posts_path(@user)
        expect(page).to have_css("img[src*='https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60']")
    end
    it 'displays users username' do
        visit user_posts_path(@user)
        expect(page).to have_content(@user.name)
    end
    it 'displays number of posts the user has written' do
        visit user_posts_path(@user)
        expect(page).to have_content(@user.posts_counter)
    end
    it 'displays the post title' do
        visit user_posts_path(@user)
        expect(page).to have_content(@first_post.title)
    end
    it 'displays the post text' do
        visit user_posts_path(@user)
        expect(page).to have_content(@first_post.text)
    end
    it 'displays the first comment' do
        visit user_posts_path(@user)
        expect(page).to have_content(@first_post.comments.first.text)
    end
    it 'displays the number of comments' do
        visit user_posts_path(@user)
        expect(page).to have_content(@first_post.comments.count)
    end
    it 'displays the number of likes' do
        visit user_posts_path(@user)
        expect(page).to have_content(@first_post.likes.count)
    end
    it 'displays pagination' do
        10.times do |_i|
            Post.create(author: @user, title: 'Hello', text: 'This is my first post')
        end
        visit user_posts_path(@user)
        expect(page).to have_css('.pagination')
    end
    it 'should redirect to post page on post click' do
        visit user_path(@user)
        click_on @first_post.title
        expect(page).to have_current_path(user_post_path(user_id: @user.id, id: @first_post.id))
    end

end
