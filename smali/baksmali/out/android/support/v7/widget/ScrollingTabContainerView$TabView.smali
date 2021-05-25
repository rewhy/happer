.class Landroid/support/v7/widget/ScrollingTabContainerView$TabView;
.super Landroid/widget/LinearLayout;
.source "ScrollingTabContainerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/ScrollingTabContainerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TabView"
.end annotation


# instance fields
.field private final BG_ATTRS:[I

.field private mCustomView:Landroid/view/View;

.field private mIconView:Landroid/widget/ImageView;

.field private mTab:Landroid/support/v7/app/ActionBar$Tab;

.field private mTextView:Landroid/widget/TextView;

.field final synthetic this$0:Landroid/support/v7/widget/ScrollingTabContainerView;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/ScrollingTabContainerView;Landroid/content/Context;Landroid/support/v7/app/ActionBar$Tab;Z)V
    .registers 8

    iput-object p1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->this$0:Landroid/support/v7/widget/ScrollingTabContainerView;

    sget p1, Landroid/support/v7/appcompat/R$attr;->actionBarTabStyle:I

    const/4 v0, 0x0

    invoke-direct {p0, p2, v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 v1, 0x0

    const v2, 0x10100d4

    aput v2, p1, v1

    iput-object p1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->BG_ATTRS:[I

    iput-object p3, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mTab:Landroid/support/v7/app/ActionBar$Tab;

    iget-object p1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->BG_ATTRS:[I

    sget p3, Landroid/support/v7/appcompat/R$attr;->actionBarTabStyle:I

    invoke-static {p2, v0, p1, p3, v1}, Landroid/support/v7/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/widget/TintTypedArray;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_2a

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2a
    invoke-virtual {p1}, Landroid/support/v7/widget/TintTypedArray;->recycle()V

    if-eqz p4, :cond_35

    const p1, 0x800013

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->setGravity(I)V

    :cond_35
    invoke-virtual {p0}, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->update()V

    return-void
.end method


# virtual methods
.method public bindTab(Landroid/support/v7/app/ActionBar$Tab;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mTab:Landroid/support/v7/app/ActionBar$Tab;

    invoke-virtual {p0}, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->update()V

    return-void
.end method

.method public getTab()Landroid/support/v7/app/ActionBar$Tab;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mTab:Landroid/support/v7/app/ActionBar$Tab;

    return-object v0
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 3

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    const-class v0, Landroid/support/v7/app/ActionBar$Tab;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 3

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    const-class v0, Landroid/support/v7/app/ActionBar$Tab;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onMeasure(II)V
    .registers 4

    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    iget-object p1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->this$0:Landroid/support/v7/widget/ScrollingTabContainerView;

    iget p1, p1, Landroid/support/v7/widget/ScrollingTabContainerView;->mMaxTabWidth:I

    if-lez p1, :cond_20

    invoke-virtual {p0}, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->getMeasuredWidth()I

    move-result p1

    iget-object v0, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->this$0:Landroid/support/v7/widget/ScrollingTabContainerView;

    iget v0, v0, Landroid/support/v7/widget/ScrollingTabContainerView;->mMaxTabWidth:I

    if-le p1, v0, :cond_20

    iget-object p1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->this$0:Landroid/support/v7/widget/ScrollingTabContainerView;

    iget p1, p1, Landroid/support/v7/widget/ScrollingTabContainerView;->mMaxTabWidth:I

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    :cond_20
    return-void
.end method

.method public setSelected(Z)V
    .registers 3

    invoke-virtual {p0}, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->isSelected()Z

    move-result v0

    if-eq v0, p1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setSelected(Z)V

    if-eqz v0, :cond_14

    if-eqz p1, :cond_14

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->sendAccessibilityEvent(I)V

    :cond_14
    return-void
.end method

.method public update()V
    .registers 11

    iget-object v0, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mTab:Landroid/support/v7/app/ActionBar$Tab;

    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar$Tab;->getCustomView()Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz v1, :cond_36

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eq v0, p0, :cond_1b

    if-eqz v0, :cond_18

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_18
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->addView(Landroid/view/View;)V

    :cond_1b
    iput-object v1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mCustomView:Landroid/view/View;

    iget-object v0, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_26

    iget-object v0, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_26
    iget-object v0, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mIconView:Landroid/widget/ImageView;

    if-eqz v0, :cond_df

    iget-object v0, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_df

    :cond_36
    iget-object v1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mCustomView:Landroid/view/View;

    if-eqz v1, :cond_41

    iget-object v1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mCustomView:Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->removeView(Landroid/view/View;)V

    iput-object v3, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mCustomView:Landroid/view/View;

    :cond_41
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar$Tab;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar$Tab;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    const/16 v5, 0x10

    const/4 v6, 0x0

    const/4 v7, -0x2

    if-eqz v1, :cond_76

    iget-object v8, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mIconView:Landroid/widget/ImageView;

    if-nez v8, :cond_6b

    new-instance v8, Landroid/support/v7/widget/AppCompatImageView;

    invoke-virtual {p0}, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/support/v7/widget/AppCompatImageView;-><init>(Landroid/content/Context;)V

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v5, v9, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v8, v6}, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->addView(Landroid/view/View;I)V

    iput-object v8, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mIconView:Landroid/widget/ImageView;

    :cond_6b
    iget-object v8, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v8, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_84

    :cond_76
    iget-object v1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mIconView:Landroid/widget/ImageView;

    if-eqz v1, :cond_84

    iget-object v1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v1, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_84
    :goto_84
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_ba

    iget-object v2, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mTextView:Landroid/widget/TextView;

    if-nez v2, :cond_af

    new-instance v2, Landroid/support/v7/widget/AppCompatTextView;

    invoke-virtual {p0}, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->getContext()Landroid/content/Context;

    move-result-object v8

    sget v9, Landroid/support/v7/appcompat/R$attr;->actionBarTabTextStyle:I

    invoke-direct {v2, v8, v3, v9}, Landroid/support/v7/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sget-object v8, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v5, v8, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->addView(Landroid/view/View;)V

    iput-object v2, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mTextView:Landroid/widget/TextView;

    :cond_af
    iget-object v2, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_c8

    :cond_ba
    iget-object v4, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mTextView:Landroid/widget/TextView;

    if-eqz v4, :cond_c8

    iget-object v4, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v2, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_c8
    :goto_c8
    iget-object v2, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mIconView:Landroid/widget/ImageView;

    if-eqz v2, :cond_d5

    iget-object v2, p0, Landroid/support/v7/widget/ScrollingTabContainerView$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar$Tab;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_d5
    if-eqz v1, :cond_d8

    goto :goto_dc

    :cond_d8
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar$Tab;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v3

    :goto_dc
    invoke-static {p0, v3}, Landroid/support/v7/widget/TooltipCompat;->setTooltipText(Landroid/view/View;Ljava/lang/CharSequence;)V

    :cond_df
    :goto_df
    return-void
.end method
