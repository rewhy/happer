.class public Landroid/support/v7/widget/ToolbarWidgetWrapper;
.super Ljava/lang/Object;
.source "ToolbarWidgetWrapper.java"

# interfaces
.implements Landroid/support/v7/widget/DecorToolbar;


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field private static final AFFECTS_LOGO_MASK:I = 0x3

.field private static final DEFAULT_FADE_DURATION_MS:J = 0xc8L

.field private static final TAG:Ljava/lang/String; = "ToolbarWidgetWrapper"


# instance fields
.field private mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

.field private mCustomView:Landroid/view/View;

.field private mDefaultNavigationContentDescription:I

.field private mDefaultNavigationIcon:Landroid/graphics/drawable/Drawable;

.field private mDisplayOpts:I

.field private mHomeDescription:Ljava/lang/CharSequence;

.field private mIcon:Landroid/graphics/drawable/Drawable;

.field private mLogo:Landroid/graphics/drawable/Drawable;

.field mMenuPrepared:Z

.field private mNavIcon:Landroid/graphics/drawable/Drawable;

.field private mNavigationMode:I

.field private mSpinner:Landroid/widget/Spinner;

.field private mSubtitle:Ljava/lang/CharSequence;

.field private mTabView:Landroid/view/View;

.field mTitle:Ljava/lang/CharSequence;

.field private mTitleSet:Z

.field mToolbar:Landroid/support/v7/widget/Toolbar;

.field mWindowCallback:Landroid/view/Window$Callback;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/Toolbar;Z)V
    .registers 5

    sget v0, Landroid/support/v7/appcompat/R$string;->abc_action_bar_up_description:I

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_ic_ab_back_material:I

    invoke-direct {p0, p1, p2, v0, v1}, Landroid/support/v7/widget/ToolbarWidgetWrapper;-><init>(Landroid/support/v7/widget/Toolbar;ZII)V

    return-void
.end method

.method public constructor <init>(Landroid/support/v7/widget/Toolbar;ZII)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p4, 0x0

    iput p4, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mNavigationMode:I

    iput p4, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDefaultNavigationContentDescription:I

    iput-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {p1}, Landroid/support/v7/widget/Toolbar;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {p1}, Landroid/support/v7/widget/Toolbar;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSubtitle:Ljava/lang/CharSequence;

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTitle:Ljava/lang/CharSequence;

    if-eqz v0, :cond_1c

    const/4 v0, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v0, 0x0

    :goto_1d
    iput-boolean v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTitleSet:Z

    invoke-virtual {p1}, Landroid/support/v7/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mNavIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 v0, 0x0

    sget-object v1, Landroid/support/v7/appcompat/R$styleable;->ActionBar:[I

    sget v2, Landroid/support/v7/appcompat/R$attr;->actionBarStyle:I

    invoke-static {p1, v0, v1, v2, p4}, Landroid/support/v7/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/widget/TintTypedArray;

    move-result-object p1

    sget v0, Landroid/support/v7/appcompat/R$styleable;->ActionBar_homeAsUpIndicator:I

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDefaultNavigationIcon:Landroid/graphics/drawable/Drawable;

    if-eqz p2, :cond_10f

    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_title:I

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4b

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setTitle(Ljava/lang/CharSequence;)V

    :cond_4b
    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_subtitle:I

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/TintTypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5a

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setSubtitle(Ljava/lang/CharSequence;)V

    :cond_5a
    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_logo:I

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_65

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setLogo(Landroid/graphics/drawable/Drawable;)V

    :cond_65
    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_icon:I

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_70

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setIcon(Landroid/graphics/drawable/Drawable;)V

    :cond_70
    iget-object p2, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mNavIcon:Landroid/graphics/drawable/Drawable;

    if-nez p2, :cond_7d

    iget-object p2, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDefaultNavigationIcon:Landroid/graphics/drawable/Drawable;

    if-eqz p2, :cond_7d

    iget-object p2, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDefaultNavigationIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    :cond_7d
    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_displayOptions:I

    invoke-virtual {p1, p2, p4}, Landroid/support/v7/widget/TintTypedArray;->getInt(II)I

    move-result p2

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setDisplayOptions(I)V

    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_customNavigationLayout:I

    invoke-virtual {p1, p2, p4}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result p2

    if-eqz p2, :cond_a8

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p2, v1, p4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setCustomView(Landroid/view/View;)V

    iget p2, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    or-int/lit8 p2, p2, 0x10

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setDisplayOptions(I)V

    :cond_a8
    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_height:I

    invoke-virtual {p1, p2, p4}, Landroid/support/v7/widget/TintTypedArray;->getLayoutDimension(II)I

    move-result p2

    if-lez p2, :cond_bd

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object p2, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/Toolbar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_bd
    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_contentInsetStart:I

    const/4 v0, -0x1

    invoke-virtual {p1, p2, v0}, Landroid/support/v7/widget/TintTypedArray;->getDimensionPixelOffset(II)I

    move-result p2

    sget v1, Landroid/support/v7/appcompat/R$styleable;->ActionBar_contentInsetEnd:I

    invoke-virtual {p1, v1, v0}, Landroid/support/v7/widget/TintTypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    if-gez p2, :cond_ce

    if-ltz v0, :cond_db

    :cond_ce
    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-static {p2, p4}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-static {v0, p4}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {v1, p2, v0}, Landroid/support/v7/widget/Toolbar;->setContentInsetsRelative(II)V

    :cond_db
    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_titleTextStyle:I

    invoke-virtual {p1, p2, p4}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result p2

    if-eqz p2, :cond_ee

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Landroid/support/v7/widget/Toolbar;->setTitleTextAppearance(Landroid/content/Context;I)V

    :cond_ee
    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_subtitleTextStyle:I

    invoke-virtual {p1, p2, p4}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result p2

    if-eqz p2, :cond_101

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Landroid/support/v7/widget/Toolbar;->setSubtitleTextAppearance(Landroid/content/Context;I)V

    :cond_101
    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_popupTheme:I

    invoke-virtual {p1, p2, p4}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result p2

    if-eqz p2, :cond_115

    iget-object p4, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {p4, p2}, Landroid/support/v7/widget/Toolbar;->setPopupTheme(I)V

    goto :goto_115

    :cond_10f
    invoke-direct {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->detectDisplayOptions()I

    move-result p2

    iput p2, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    :cond_115
    :goto_115
    invoke-virtual {p1}, Landroid/support/v7/widget/TintTypedArray;->recycle()V

    invoke-virtual {p0, p3}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setDefaultNavigationContentDescription(I)V

    iget-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {p1}, Landroid/support/v7/widget/Toolbar;->getNavigationContentDescription()Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mHomeDescription:Ljava/lang/CharSequence;

    iget-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    new-instance p2, Landroid/support/v7/widget/ToolbarWidgetWrapper$1;

    invoke-direct {p2, p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper$1;-><init>(Landroid/support/v7/widget/ToolbarWidgetWrapper;)V

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private detectDisplayOptions()I
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_13

    const/16 v0, 0xf

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDefaultNavigationIcon:Landroid/graphics/drawable/Drawable;

    goto :goto_15

    :cond_13
    const/16 v0, 0xb

    :goto_15
    return v0
.end method

.method private ensureSpinner()V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    if-nez v0, :cond_20

    new-instance v0, Landroid/support/v7/widget/AppCompatSpinner;

    invoke-virtual {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    sget v3, Landroid/support/v7/appcompat/R$attr;->actionDropDownStyle:I

    invoke-direct {v0, v1, v2, v3}, Landroid/support/v7/widget/AppCompatSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    new-instance v0, Landroid/support/v7/widget/Toolbar$LayoutParams;

    const v1, 0x800013

    const/4 v2, -0x2

    invoke-direct {v0, v2, v2, v1}, Landroid/support/v7/widget/Toolbar$LayoutParams;-><init>(III)V

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    invoke-virtual {v1, v0}, Landroid/widget/Spinner;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_20
    return-void
.end method

.method private setTitleInt(Ljava/lang/CharSequence;)V
    .registers 3

    iput-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTitle:Ljava/lang/CharSequence;

    iget v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_d

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    :cond_d
    return-void
.end method

.method private updateHomeAccessibility()V
    .registers 3

    iget v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_1d

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mHomeDescription:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDefaultNavigationContentDescription:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationContentDescription(I)V

    goto :goto_1d

    :cond_16
    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mHomeDescription:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    :cond_1d
    :goto_1d
    return-void
.end method

.method private updateNavigationIcon()V
    .registers 3

    iget v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_15

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mNavIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_f

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mNavIcon:Landroid/graphics/drawable/Drawable;

    goto :goto_11

    :cond_f
    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDefaultNavigationIcon:Landroid/graphics/drawable/Drawable;

    :goto_11
    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1b

    :cond_15
    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    :goto_1b
    return-void
.end method

.method private updateToolbarLogo()V
    .registers 3

    iget v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_19

    iget v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_16

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mLogo:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_13

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mLogo:Landroid/graphics/drawable/Drawable;

    goto :goto_1a

    :cond_13
    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mIcon:Landroid/graphics/drawable/Drawable;

    goto :goto_1a

    :cond_16
    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mIcon:Landroid/graphics/drawable/Drawable;

    goto :goto_1a

    :cond_19
    const/4 v0, 0x0

    :goto_1a
    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setLogo(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public animateToVisibility(I)V
    .registers 4

    const-wide/16 v0, 0xc8

    invoke-virtual {p0, p1, v0, v1}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setupAnimatorToVisibility(IJ)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    if-eqz p1, :cond_b

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    :cond_b
    return-void
.end method

.method public canShowOverflowMenu()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->canShowOverflowMenu()Z

    move-result v0

    return v0
.end method

.method public collapseActionView()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->collapseActionView()V

    return-void
.end method

.method public dismissPopupMenus()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->dismissPopupMenus()V

    return-void
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getCustomView()Landroid/view/View;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    return-object v0
.end method

.method public getDisplayOptions()I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    return v0
.end method

.method public getDropdownItemCount()I
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getCount()I

    move-result v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return v0
.end method

.method public getDropdownSelectedPosition()I
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return v0
.end method

.method public getHeight()I
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getHeight()I

    move-result v0

    return v0
.end method

.method public getMenu()Landroid/view/Menu;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v0

    return-object v0
.end method

.method public getNavigationMode()I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mNavigationMode:I

    return v0
.end method

.method public getSubtitle()Ljava/lang/CharSequence;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getViewGroup()Landroid/view/ViewGroup;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    return-object v0
.end method

.method public getVisibility()I
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getVisibility()I

    move-result v0

    return v0
.end method

.method public hasEmbeddedTabs()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public hasExpandedActionView()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->hasExpandedActionView()Z

    move-result v0

    return v0
.end method

.method public hasIcon()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public hasLogo()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mLogo:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public hideOverflowMenu()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->hideOverflowMenu()Z

    move-result v0

    return v0
.end method

.method public initIndeterminateProgress()V
    .registers 3

    const-string v0, "ToolbarWidgetWrapper"

    const-string v1, "Progress display unsupported"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public initProgress()V
    .registers 3

    const-string v0, "ToolbarWidgetWrapper"

    const-string v1, "Progress display unsupported"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public isOverflowMenuShowPending()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->isOverflowMenuShowPending()Z

    move-result v0

    return v0
.end method

.method public isOverflowMenuShowing()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->isOverflowMenuShowing()Z

    move-result v0

    return v0
.end method

.method public isTitleTruncated()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->isTitleTruncated()Z

    move-result v0

    return v0
.end method

.method public restoreHierarchyState(Landroid/util/SparseArray;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->restoreHierarchyState(Landroid/util/SparseArray;)V

    return-void
.end method

.method public saveHierarchyState(Landroid/util/SparseArray;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->saveHierarchyState(Landroid/util/SparseArray;)V

    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-static {v0, p1}, Landroid/support/v4/view/ViewCompat;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setCollapsible(Z)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->setCollapsible(Z)V

    return-void
.end method

.method public setCustomView(Landroid/view/View;)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    if-eqz v0, :cond_11

    iget v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->removeView(Landroid/view/View;)V

    :cond_11
    iput-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    if-eqz p1, :cond_22

    iget p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 p1, p1, 0x10

    if-eqz p1, :cond_22

    iget-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;)V

    :cond_22
    return-void
.end method

.method public setDefaultNavigationContentDescription(I)V
    .registers 3

    iget v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDefaultNavigationContentDescription:I

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDefaultNavigationContentDescription:I

    iget-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {p1}, Landroid/support/v7/widget/Toolbar;->getNavigationContentDescription()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_18

    iget p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDefaultNavigationContentDescription:I

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setNavigationContentDescription(I)V

    :cond_18
    return-void
.end method

.method public setDefaultNavigationIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDefaultNavigationIcon:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_9

    iput-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDefaultNavigationIcon:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->updateNavigationIcon()V

    :cond_9
    return-void
.end method

.method public setDisplayOptions(I)V
    .registers 5

    iget v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    xor-int/2addr v0, p1

    iput p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    if-eqz v0, :cond_59

    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_15

    and-int/lit8 v1, p1, 0x4

    if-eqz v1, :cond_12

    invoke-direct {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->updateHomeAccessibility()V

    :cond_12
    invoke-direct {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->updateNavigationIcon()V

    :cond_15
    and-int/lit8 v1, v0, 0x3

    if-eqz v1, :cond_1c

    invoke-direct {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->updateToolbarLogo()V

    :cond_1c
    and-int/lit8 v1, v0, 0x8

    if-eqz v1, :cond_3e

    and-int/lit8 v1, p1, 0x8

    if-eqz v1, :cond_33

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v2, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v2, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSubtitle:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    goto :goto_3e

    :cond_33
    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    :cond_3e
    :goto_3e
    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_59

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    if-eqz v0, :cond_59

    and-int/lit8 p1, p1, 0x10

    if-eqz p1, :cond_52

    iget-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;)V

    goto :goto_59

    :cond_52
    iget-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mCustomView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/Toolbar;->removeView(Landroid/view/View;)V

    :cond_59
    :goto_59
    return-void
.end method

.method public setDropdownParams(Landroid/widget/SpinnerAdapter;Landroid/widget/AdapterView$OnItemSelectedListener;)V
    .registers 4

    invoke-direct {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->ensureSpinner()V

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0, p1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    iget-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    return-void
.end method

.method public setDropdownSelectedPosition(I)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_a

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0, p1}, Landroid/widget/Spinner;->setSelection(I)V

    return-void

    :cond_a
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Can\'t set dropdown selected position without an adapter"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setEmbeddedTabView(Landroid/support/v7/widget/ScrollingTabContainerView;)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    if-eqz v0, :cond_15

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-ne v0, v1, :cond_15

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->removeView(Landroid/view/View;)V

    :cond_15
    iput-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    if-eqz p1, :cond_3c

    iget v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mNavigationMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_3c

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;I)V

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar$LayoutParams;

    const/4 v1, -0x2

    iput v1, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->width:I

    iput v1, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->height:I

    const v1, 0x800053

    iput v1, v0, Landroid/support/v7/widget/Toolbar$LayoutParams;->gravity:I

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/ScrollingTabContainerView;->setAllowCollapse(Z)V

    :cond_3c
    return-void
.end method

.method public setHomeButtonEnabled(Z)V
    .registers 2

    return-void
.end method

.method public setIcon(I)V
    .registers 3

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v7/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setIcon(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mIcon:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->updateToolbarLogo()V

    return-void
.end method

.method public setLogo(I)V
    .registers 3

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v7/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setLogo(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setLogo(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mLogo:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->updateToolbarLogo()V

    return-void
.end method

.method public setMenu(Landroid/view/Menu;Landroid/support/v7/view/menu/MenuPresenter$Callback;)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-nez v0, :cond_18

    new-instance v0, Landroid/support/v7/widget/ActionMenuPresenter;

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/ActionMenuPresenter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    sget v1, Landroid/support/v7/appcompat/R$id;->action_menu_presenter:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ActionMenuPresenter;->setId(I)V

    :cond_18
    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0, p2}, Landroid/support/v7/widget/ActionMenuPresenter;->setCallback(Landroid/support/v7/view/menu/MenuPresenter$Callback;)V

    iget-object p2, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    check-cast p1, Landroid/support/v7/view/menu/MenuBuilder;

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {p2, p1, v0}, Landroid/support/v7/widget/Toolbar;->setMenu(Landroid/support/v7/view/menu/MenuBuilder;Landroid/support/v7/widget/ActionMenuPresenter;)V

    return-void
.end method

.method public setMenuCallbacks(Landroid/support/v7/view/menu/MenuPresenter$Callback;Landroid/support/v7/view/menu/MenuBuilder$Callback;)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/Toolbar;->setMenuCallbacks(Landroid/support/v7/view/menu/MenuPresenter$Callback;Landroid/support/v7/view/menu/MenuBuilder$Callback;)V

    return-void
.end method

.method public setMenuPrepared()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mMenuPrepared:Z

    return-void
.end method

.method public setNavigationContentDescription(I)V
    .registers 3

    if-nez p1, :cond_4

    const/4 p1, 0x0

    goto :goto_c

    :cond_4
    invoke-virtual {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_c
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setNavigationContentDescription(Ljava/lang/CharSequence;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mHomeDescription:Ljava/lang/CharSequence;

    invoke-direct {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->updateHomeAccessibility()V

    return-void
.end method

.method public setNavigationIcon(I)V
    .registers 3

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v7/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setNavigationIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mNavIcon:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->updateNavigationIcon()V

    return-void
.end method

.method public setNavigationMode(I)V
    .registers 5

    iget v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mNavigationMode:I

    if-eq p1, v0, :cond_78

    packed-switch v0, :pswitch_data_7a

    goto :goto_33

    :pswitch_8
    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    if-eqz v0, :cond_33

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-ne v0, v1, :cond_33

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->removeView(Landroid/view/View;)V

    goto :goto_33

    :pswitch_1e
    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_33

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-ne v0, v1, :cond_33

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->removeView(Landroid/view/View;)V

    :cond_33
    :goto_33
    iput p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mNavigationMode:I

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_82

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid navigation mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_50
    iget-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    if-eqz p1, :cond_78

    iget-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    invoke-virtual {p1, v1, v0}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;I)V

    iget-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTabView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/Toolbar$LayoutParams;

    const/4 v0, -0x2

    iput v0, p1, Landroid/support/v7/widget/Toolbar$LayoutParams;->width:I

    iput v0, p1, Landroid/support/v7/widget/Toolbar$LayoutParams;->height:I

    const v0, 0x800053

    iput v0, p1, Landroid/support/v7/widget/Toolbar$LayoutParams;->gravity:I

    goto :goto_78

    :pswitch_6e
    invoke-direct {p0}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->ensureSpinner()V

    iget-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSpinner:Landroid/widget/Spinner;

    invoke-virtual {p1, v1, v0}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;I)V

    :cond_78
    :goto_78
    :pswitch_78
    return-void

    nop

    :pswitch_data_7a
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_8
    .end packed-switch

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_78
        :pswitch_6e
        :pswitch_50
    .end packed-switch
.end method

.method public setSubtitle(Ljava/lang/CharSequence;)V
    .registers 3

    iput-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mSubtitle:Ljava/lang/CharSequence;

    iget v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mDisplayOpts:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_d

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    :cond_d
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTitleSet:Z

    invoke-direct {p0, p1}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setTitleInt(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setVisibility(I)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    return-void
.end method

.method public setWindowCallback(Landroid/view/Window$Callback;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mWindowCallback:Landroid/view/Window$Callback;

    return-void
.end method

.method public setWindowTitle(Ljava/lang/CharSequence;)V
    .registers 3

    iget-boolean v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mTitleSet:Z

    if-nez v0, :cond_7

    invoke-direct {p0, p1}, Landroid/support/v7/widget/ToolbarWidgetWrapper;->setTitleInt(Ljava/lang/CharSequence;)V

    :cond_7
    return-void
.end method

.method public setupAnimatorToVisibility(IJ)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 6

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    if-nez p1, :cond_b

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_c

    :cond_b
    const/4 v1, 0x0

    :goto_c
    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p2

    new-instance p3, Landroid/support/v7/widget/ToolbarWidgetWrapper$2;

    invoke-direct {p3, p0, p1}, Landroid/support/v7/widget/ToolbarWidgetWrapper$2;-><init>(Landroid/support/v7/widget/ToolbarWidgetWrapper;I)V

    invoke-virtual {p2, p3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    return-object p1
.end method

.method public showOverflowMenu()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ToolbarWidgetWrapper;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->showOverflowMenu()Z

    move-result v0

    return v0
.end method
