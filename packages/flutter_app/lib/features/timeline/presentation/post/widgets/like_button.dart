import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({
    super.key,
    required this.isLiked,
    required this.likesCount,
    required this.onPressed,
  });

  final bool isLiked;
  final int likesCount;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
          ),
          onPressed: onPressed,
          color: isLiked ? Colors.red : Theme.of(context).iconTheme.color,
        ),
        Text('$likesCount likes'),
      ],
    );
  }
}
