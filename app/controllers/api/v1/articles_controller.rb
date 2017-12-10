module Api
  module V1
    class ArticlesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @articles = Article.order('created_at')
        render json: {status: 'SUCCESS', message: 'Load Success', data: @articles}, status: :ok
      end

      def show
        article = Article.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Load Success', data: article}, status: :ok
      end

      def create
        article = Article.new(article_params)
        if article.save
          render json: {status: 'SUCCESS', message: 'Load Success', data: article}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Not Saved', data: article.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        article = Article.find(params[:id])
        article.destroy
        render json: {status: 'SUCCESS', message: 'Delete Success', data: article}, status: :ok
      end

      def update
        article = Article.new(article_params)
        if article.update_attributes(article_params)
          render json: {status: 'SUCCESS', message: 'Update Success', data: article}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Not Updated', data: article.errors}, status: :unprocessable_entity
        end
      end

      private

      def article_params
        params.permit(:title, :body)
      end

    end
  end
end