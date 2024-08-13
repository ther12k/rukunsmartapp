#!/bin/bash

# Create main directory structure
mkdir -p lib/{core,features,shared}

# Create core directories
mkdir -p lib/core/{config,theme}

# Create shared directories
mkdir -p lib/shared/{widgets,models,services}

# Create feature directories
features=(auth home region finance complaint emergency news billing)

for feature in "${features[@]}"
do
    mkdir -p lib/features/$feature/{bloc,models,repositories,screens,widgets}
    
    # Create bloc files
    touch lib/features/$feature/bloc/{${feature}_bloc.dart,${feature}_event.dart,${feature}_state.dart}
    
    # Create model file
    touch lib/features/$feature/models/${feature}_model.dart
    
    # Create repository file
    touch lib/features/$feature/repositories/${feature}_repository.dart
    
    # Create screen file
    touch lib/features/$feature/screens/${feature}_screen.dart
done

# Add specific files for auth feature
touch lib/features/auth/screens/login_screen.dart

# Add specific files for home feature
touch lib/features/home/widgets/finance_summary_widget.dart

# Add specific files for region feature
touch lib/features/region/widgets/region_card_widget.dart

# Add specific files for finance feature
touch lib/features/finance/widgets/transaction_list_widget.dart

# Add specific files for emergency feature
touch lib/features/emergency/widgets/emergency_button_widget.dart

# Add specific files for billing feature
touch lib/features/billing/screens/payment_screen.dart
touch lib/features/billing/widgets/receipt_upload_widget.dart
touch lib/features/billing/widgets/bill_list_widget.dart
touch lib/features/billing/widgets/bill_card_widget.dart
touch lib/features/billing/models/payment_model.dart

# Create main.dart and app.dart in lib directory
touch lib/{main.dart,app.dart}

# Create shared files
touch lib/shared/models/{user_model.dart,region_model.dart}
touch lib/shared/services/{api_service.dart,storage_service.dart}
touch lib/shared/widgets/{custom_button.dart,loading_indicator.dart}

# Create core files
touch lib/core/config/app_config.dart
touch lib/core/theme/app_theme.dart

echo "RukunSmart app feature-based structure created successfully!"