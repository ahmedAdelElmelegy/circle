import 'package:circle/core/helpers/constants.dart';
import 'package:flutter/material.dart';

class ModernErrorScreen extends StatelessWidget {
  final String? customMessage;
  final String? errorDetails;
  final VoidCallback? onRetry;
  final VoidCallback? onGoBack;

  const ModernErrorScreen({
    Key? key,
    this.customMessage,
    this.errorDetails,
    this.onRetry,
    this.onGoBack,
  }) : super(key: key);

  String _getErrorMessage() {
    if (customMessage != null) return customMessage!;
    if (errorDetails == null) return 'An unexpected error occurred.';

    try {
      final errorString = errorDetails!.toLowerCase();

      // Network errors
      if (errorString.contains('network') || errorString.contains('socket')) {
        return 'Please check your internet connection and try again.';
      }

      // Timeout errors
      else if (errorString.contains('timeout')) {
        return 'The request took too long to complete. Please try again.';
      }

      // Not found errors
      else if (errorString.contains('not found') ||
          errorString.contains('404')) {
        return 'The page you\'re looking for doesn\'t exist.';
      }

      // Permission/Authorization errors
      else if (errorString.contains('permission') ||
          errorString.contains('unauthorized') ||
          errorString.contains('401') ||
          errorString.contains('403')) {
        return 'You don\'t have permission to access this resource.';
      }

      // Bad request
      else if (errorString.contains('bad request') ||
          errorString.contains('400')) {
        return 'Invalid request. Please check your input.';
      }

      // Validation errors
      else if (errorString.contains('validation') ||
          errorString.contains('422')) {
        return 'Please check your input data and try again.';
      }

      // Too many requests
      else if (errorString.contains('too many requests') ||
          errorString.contains('429')) {
        return 'Too many requests. Please try again later.';
      }

      // Server errors (500+)
      else if (errorString.contains('500') ||
          errorString.contains('502') ||
          errorString.contains('503') ||
          errorString.contains('504') ||
          errorString.contains('internal server error') ||
          errorString.contains('bad gateway') ||
          errorString.contains('service unavailable') ||
          errorString.contains('gateway timeout')) {
        return 'Something went wrong on our end. Please try again later.';
      }

      // Format/Parse errors
      else if (errorString.contains('format') ||
          errorString.contains('parse')) {
        return 'Invalid response from server. Please try again.';
      }

      // Connection errors
      else if (errorString.contains('connection')) {
        return 'Could not connect to server. Please try again.';
      }

      // Certificate errors
      else if (errorString.contains('certificate') ||
          errorString.contains('ssl')) {
        return 'Security certificate error. Please check your connection.';
      }

      // Cancelled request
      else if (errorString.contains('cancel')) {
        return 'Request was cancelled. Please try again.';
      }

      // Flutter/UI errors
      else if (errorString.contains('renderflex overflowed')) {
        return 'Layout issue detected. Please resize your window or check the UI.';
      } else if (errorString.contains('setstate')) {
        return 'A widget tried to update after being removed.';
      } else if (errorString.contains('null check operator')) {
        return 'Missing required data. Please try again.';
      } else if (errorString.contains('type') &&
          errorString.contains('is not a subtype')) {
        return 'Data type mismatch. Please refresh the app.';
      }

      // Default
      else {
        return 'Don\'t worry, these things happen. Let\'s get you back on track.';
      }
    } catch (e) {
      return 'An unexpected error occurred.';
    }
  }

  String _getErrorTitle() {
    if (errorDetails == null) return 'Oops! Something went wrong';

    try {
      final errorString = errorDetails!.toLowerCase();

      if (errorString.contains('network') || errorString.contains('socket')) {
        return 'Network Error';
      } else if (errorString.contains('timeout')) {
        return 'Timeout Error';
      } else if (errorString.contains('not found') ||
          errorString.contains('404')) {
        return 'Page Not Found';
      } else if (errorString.contains('permission') ||
          errorString.contains('unauthorized') ||
          errorString.contains('401') ||
          errorString.contains('403')) {
        return 'Access Denied';
      } else if (errorString.contains('400') ||
          errorString.contains('bad request') ||
          errorString.contains('validation') ||
          errorString.contains('422')) {
        return 'Invalid Request';
      } else if (errorString.contains('500') ||
          errorString.contains('server') ||
          errorString.contains('502') ||
          errorString.contains('503') ||
          errorString.contains('504')) {
        return 'Server Error';
      } else if (errorString.contains('renderflex')) {
        return 'Display Issue';
      } else if (errorString.contains('connection')) {
        return 'Connection Problem';
      } else {
        return 'Oops! Something went wrong';
      }
    } catch (e) {
      return 'Oops! Something went wrong';
    }
  }

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFFEF4444);

    return Material(
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Error Image/Icon
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Image.asset(
                      Assets.opps,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error_outline_rounded,
                          size: 120,
                          color: color,
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Error Title
                  Text(
                    _getErrorTitle(),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1F2937),
                            ) ??
                        const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  // Error Message
                  Text(
                    _getErrorMessage(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: const Color(0xFF6B7280),
                              height: 1.5,
                            ) ??
                        const TextStyle(
                          color: Color(0xFF6B7280),
                          height: 1.5,
                        ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  // Error Details Card (Expandable)
                  if (errorDetails != null) ...[
                    Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(maxWidth: 400),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: color.withValues(alpha: 0.1),
                          width: 1,
                        ),
                      ),
                      child: Theme(
                        data: ThemeData(
                          dividerColor: Colors.transparent,
                          splashColor: color.withValues(alpha: 0.1),
                          highlightColor: color.withValues(alpha: 0.05),
                        ),
                        child: ExpansionTile(
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          leading: const Icon(
                            Icons.info_outline_rounded,
                            color: color,
                          ),
                          title: const Text(
                            'Technical Details',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: color,
                            ),
                          ),
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              child: SelectableText(
                                errorDetails!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'monospace',
                                  color: Color(0xFF374151),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],

                  // Action Buttons
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      // Retry Button
                      if (onRetry != null)
                        ElevatedButton.icon(
                          onPressed: onRetry,
                          icon: const Icon(Icons.refresh_rounded),
                          label: const Text('Try Again'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: color,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                        ),

                      // Go Back Button
                      OutlinedButton.icon(
                        onPressed: onGoBack ??
                            () {
                              try {
                                if (Navigator.of(context).canPop()) {
                                  Navigator.of(context).pop();
                                }
                              } catch (e) {
                                debugPrint('Navigation error: $e');
                              }
                            },
                        icon: const Icon(Icons.arrow_back_rounded),
                        label: const Text('Go Back'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF6B7280),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: const BorderSide(
                            color: Color(0xFFD1D5DB),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Example Usage:
/*
// Auto-detect error from exception
try {
  await apiService.get(endpoint: '/users');
} catch (e) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ModernErrorScreen(
        errorDetails: e.toString(),
        onRetry: () {
          Navigator.pop(context);
          fetchUsers();
        },
      ),
    ),
  );
}

// Custom message override
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ModernErrorScreen(
      customMessage: 'Your custom error message here',
      errorDetails: 'Technical details: ${e.toString()}',
    ),
  ),
);

// Simple usage
ModernErrorScreen(
  errorDetails: 'SocketException: Network error',
  onRetry: () => retryAction(),
)
*/
