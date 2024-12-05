import 'package:flutter/material.dart';
import 'package:simplified_unidirectional_dataflow/models/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const Divider(height: 24),
              _buildTitle(context),
              const SizedBox(height: 12),
              _buildBody(context),
              const SizedBox(height: 4),
            ],
          ),
        ),
      );

  Widget _buildBody(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          post.body,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                height: 1.5,
              ),
        ),
      );

  Widget _buildHeader(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Post #${post.id}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'User #${post.userId}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      );

  Widget _buildTitle(BuildContext context) => Text(
        post.title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
      );
}
