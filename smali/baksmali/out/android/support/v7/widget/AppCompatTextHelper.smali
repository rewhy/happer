.class Landroid/support/v7/widget/AppCompatTextHelper;
.super Ljava/lang/Object;
.source "AppCompatTextHelper.java"


# static fields
.field private static final MONOSPACE:I = 0x3

.field private static final SANS:I = 0x1

.field private static final SERIF:I = 0x2


# instance fields
.field private mAsyncFontPending:Z

.field private final mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private mDrawableBottomTint:Landroid/support/v7/widget/TintInfo;

.field private mDrawableEndTint:Landroid/support/v7/widget/TintInfo;

.field private mDrawableLeftTint:Landroid/support/v7/widget/TintInfo;

.field private mDrawableRightTint:Landroid/support/v7/widget/TintInfo;

.field private mDrawableStartTint:Landroid/support/v7/widget/TintInfo;

.field private mDrawableTopTint:Landroid/support/v7/widget/TintInfo;

.field private mFontTypeface:Landroid/graphics/Typeface;

.field private mStyle:I

.field private final mView:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mStyle:I

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    new-instance p1, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-direct {p1, v0}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;-><init>(Landroid/widget/TextView;)V

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    return-void
.end method

.method private applyCompoundDrawableTint(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;)V
    .registers 4

    if-eqz p1, :cond_d

    if-eqz p2, :cond_d

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getDrawableState()[I

    move-result-object v0

    invoke-static {p1, p2, v0}, Landroid/support/v7/widget/AppCompatDrawableManager;->tintDrawable(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;[I)V

    :cond_d
    return-void
.end method

.method private static createTintInfo(Landroid/content/Context;Landroid/support/v7/widget/AppCompatDrawableManager;I)Landroid/support/v7/widget/TintInfo;
    .registers 3

    invoke-virtual {p1, p0, p2}, Landroid/support/v7/widget/AppCompatDrawableManager;->getTintList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_11

    new-instance p1, Landroid/support/v7/widget/TintInfo;

    invoke-direct {p1}, Landroid/support/v7/widget/TintInfo;-><init>()V

    const/4 p2, 0x1

    iput-boolean p2, p1, Landroid/support/v7/widget/TintInfo;->mHasTintList:Z

    iput-object p0, p1, Landroid/support/v7/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    return-object p1

    :cond_11
    const/4 p0, 0x0

    return-object p0
.end method

.method private setTextSizeInternal(IF)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->setTextSizeInternal(IF)V

    return-void
.end method

.method private updateTypefaceAndStyle(Landroid/content/Context;Landroid/support/v7/widget/TintTypedArray;)V
    .registers 7

    sget v0, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textStyle:I

    iget v1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mStyle:I

    invoke-virtual {p2, v0, v1}, Landroid/support/v7/widget/TintTypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mStyle:I

    sget v0, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_fontFamily:I

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_40

    sget v0, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_fontFamily:I

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_1d

    goto :goto_40

    :cond_1d
    sget p1, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_typeface:I

    invoke-virtual {p2, p1}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_3f

    iput-boolean v2, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAsyncFontPending:Z

    sget p1, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_typeface:I

    invoke-virtual {p2, p1, v1}, Landroid/support/v7/widget/TintTypedArray;->getInt(II)I

    move-result p1

    packed-switch p1, :pswitch_data_88

    goto :goto_3f

    :pswitch_31
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mFontTypeface:Landroid/graphics/Typeface;

    goto :goto_3f

    :pswitch_36
    sget-object p1, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mFontTypeface:Landroid/graphics/Typeface;

    goto :goto_3f

    :pswitch_3b
    sget-object p1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mFontTypeface:Landroid/graphics/Typeface;

    :cond_3f
    :goto_3f
    return-void

    :cond_40
    :goto_40
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mFontTypeface:Landroid/graphics/Typeface;

    sget v0, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_fontFamily:I

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_4e

    sget v0, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_fontFamily:I

    goto :goto_50

    :cond_4e
    sget v0, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_fontFamily:I

    :goto_50
    invoke-virtual {p1}, Landroid/content/Context;->isRestricted()Z

    move-result p1

    if-nez p1, :cond_74

    new-instance p1, Ljava/lang/ref/WeakReference;

    iget-object v3, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-direct {p1, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    new-instance v3, Landroid/support/v7/widget/AppCompatTextHelper$1;

    invoke-direct {v3, p0, p1}, Landroid/support/v7/widget/AppCompatTextHelper$1;-><init>(Landroid/support/v7/widget/AppCompatTextHelper;Ljava/lang/ref/WeakReference;)V

    :try_start_62
    iget p1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mStyle:I

    invoke-virtual {p2, v0, p1, v3}, Landroid/support/v7/widget/TintTypedArray;->getFont(IILandroid/support/v4/content/res/ResourcesCompat$FontCallback;)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mFontTypeface:Landroid/graphics/Typeface;

    iget-object p1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mFontTypeface:Landroid/graphics/Typeface;

    if-nez p1, :cond_6f

    goto :goto_70

    :cond_6f
    const/4 v1, 0x0

    :goto_70
    iput-boolean v1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAsyncFontPending:Z
    :try_end_72
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_62 .. :try_end_72} :catch_73
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_62 .. :try_end_72} :catch_73

    goto :goto_74

    :catch_73
    nop

    :cond_74
    :goto_74
    iget-object p1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mFontTypeface:Landroid/graphics/Typeface;

    if-nez p1, :cond_86

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/TintTypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_86

    iget p2, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mStyle:I

    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mFontTypeface:Landroid/graphics/Typeface;

    :cond_86
    return-void

    nop

    :pswitch_data_88
    .packed-switch 0x1
        :pswitch_3b
        :pswitch_36
        :pswitch_31
    .end packed-switch
.end method


# virtual methods
.method applyCompoundDrawablesTints()V
    .registers 6

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableLeftTint:Landroid/support/v7/widget/TintInfo;

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-nez v0, :cond_12

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableTopTint:Landroid/support/v7/widget/TintInfo;

    if-nez v0, :cond_12

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableRightTint:Landroid/support/v7/widget/TintInfo;

    if-nez v0, :cond_12

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableBottomTint:Landroid/support/v7/widget/TintInfo;

    if-eqz v0, :cond_36

    :cond_12
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    aget-object v3, v0, v2

    iget-object v4, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableLeftTint:Landroid/support/v7/widget/TintInfo;

    invoke-direct {p0, v3, v4}, Landroid/support/v7/widget/AppCompatTextHelper;->applyCompoundDrawableTint(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;)V

    const/4 v3, 0x1

    aget-object v3, v0, v3

    iget-object v4, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableTopTint:Landroid/support/v7/widget/TintInfo;

    invoke-direct {p0, v3, v4}, Landroid/support/v7/widget/AppCompatTextHelper;->applyCompoundDrawableTint(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;)V

    aget-object v3, v0, v1

    iget-object v4, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableRightTint:Landroid/support/v7/widget/TintInfo;

    invoke-direct {p0, v3, v4}, Landroid/support/v7/widget/AppCompatTextHelper;->applyCompoundDrawableTint(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;)V

    const/4 v3, 0x3

    aget-object v0, v0, v3

    iget-object v3, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableBottomTint:Landroid/support/v7/widget/TintInfo;

    invoke-direct {p0, v0, v3}, Landroid/support/v7/widget/AppCompatTextHelper;->applyCompoundDrawableTint(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;)V

    :cond_36
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v0, v3, :cond_58

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableStartTint:Landroid/support/v7/widget/TintInfo;

    if-nez v0, :cond_44

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableEndTint:Landroid/support/v7/widget/TintInfo;

    if-eqz v0, :cond_58

    :cond_44
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    aget-object v2, v0, v2

    iget-object v3, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableStartTint:Landroid/support/v7/widget/TintInfo;

    invoke-direct {p0, v2, v3}, Landroid/support/v7/widget/AppCompatTextHelper;->applyCompoundDrawableTint(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;)V

    aget-object v0, v0, v1

    iget-object v1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableEndTint:Landroid/support/v7/widget/TintInfo;

    invoke-direct {p0, v0, v1}, Landroid/support/v7/widget/AppCompatTextHelper;->applyCompoundDrawableTint(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;)V

    :cond_58
    return-void
.end method

.method autoSizeText()V
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->autoSizeText()V

    return-void
.end method

.method getAutoSizeMaxTextSize()I
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->getAutoSizeMaxTextSize()I

    move-result v0

    return v0
.end method

.method getAutoSizeMinTextSize()I
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->getAutoSizeMinTextSize()I

    move-result v0

    return v0
.end method

.method getAutoSizeStepGranularity()I
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->getAutoSizeStepGranularity()I

    move-result v0

    return v0
.end method

.method getAutoSizeTextAvailableSizes()[I
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->getAutoSizeTextAvailableSizes()[I

    move-result-object v0

    return-object v0
.end method

.method getAutoSizeTextType()I
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->getAutoSizeTextType()I

    move-result v0

    return v0
.end method

.method isAutoSizeEnabled()Z
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->isAutoSizeEnabled()Z

    move-result v0

    return v0
.end method

.method loadFromAttributes(Landroid/util/AttributeSet;I)V
    .registers 20
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    iget-object v3, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {}, Landroid/support/v7/widget/AppCompatDrawableManager;->get()Landroid/support/v7/widget/AppCompatDrawableManager;

    move-result-object v4

    sget-object v5, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextHelper:[I

    const/4 v6, 0x0

    invoke-static {v3, v1, v5, v2, v6}, Landroid/support/v7/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/widget/TintTypedArray;

    move-result-object v5

    sget v7, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextHelper_android_textAppearance:I

    const/4 v8, -0x1

    invoke-virtual {v5, v7, v8}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result v7

    sget v9, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextHelper_android_drawableLeft:I

    invoke-virtual {v5, v9}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v9

    if-eqz v9, :cond_32

    sget v9, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextHelper_android_drawableLeft:I

    invoke-virtual {v5, v9, v6}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result v9

    invoke-static {v3, v4, v9}, Landroid/support/v7/widget/AppCompatTextHelper;->createTintInfo(Landroid/content/Context;Landroid/support/v7/widget/AppCompatDrawableManager;I)Landroid/support/v7/widget/TintInfo;

    move-result-object v9

    iput-object v9, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableLeftTint:Landroid/support/v7/widget/TintInfo;

    :cond_32
    sget v9, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextHelper_android_drawableTop:I

    invoke-virtual {v5, v9}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v9

    if-eqz v9, :cond_46

    sget v9, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextHelper_android_drawableTop:I

    invoke-virtual {v5, v9, v6}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result v9

    invoke-static {v3, v4, v9}, Landroid/support/v7/widget/AppCompatTextHelper;->createTintInfo(Landroid/content/Context;Landroid/support/v7/widget/AppCompatDrawableManager;I)Landroid/support/v7/widget/TintInfo;

    move-result-object v9

    iput-object v9, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableTopTint:Landroid/support/v7/widget/TintInfo;

    :cond_46
    sget v9, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextHelper_android_drawableRight:I

    invoke-virtual {v5, v9}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v9

    if-eqz v9, :cond_5a

    sget v9, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextHelper_android_drawableRight:I

    invoke-virtual {v5, v9, v6}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result v9

    invoke-static {v3, v4, v9}, Landroid/support/v7/widget/AppCompatTextHelper;->createTintInfo(Landroid/content/Context;Landroid/support/v7/widget/AppCompatDrawableManager;I)Landroid/support/v7/widget/TintInfo;

    move-result-object v9

    iput-object v9, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableRightTint:Landroid/support/v7/widget/TintInfo;

    :cond_5a
    sget v9, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextHelper_android_drawableBottom:I

    invoke-virtual {v5, v9}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v9

    if-eqz v9, :cond_6e

    sget v9, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextHelper_android_drawableBottom:I

    invoke-virtual {v5, v9, v6}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result v9

    invoke-static {v3, v4, v9}, Landroid/support/v7/widget/AppCompatTextHelper;->createTintInfo(Landroid/content/Context;Landroid/support/v7/widget/AppCompatDrawableManager;I)Landroid/support/v7/widget/TintInfo;

    move-result-object v9

    iput-object v9, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableBottomTint:Landroid/support/v7/widget/TintInfo;

    :cond_6e
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x11

    if-lt v9, v10, :cond_9c

    sget v9, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextHelper_android_drawableStart:I

    invoke-virtual {v5, v9}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v9

    if-eqz v9, :cond_88

    sget v9, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextHelper_android_drawableStart:I

    invoke-virtual {v5, v9, v6}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result v9

    invoke-static {v3, v4, v9}, Landroid/support/v7/widget/AppCompatTextHelper;->createTintInfo(Landroid/content/Context;Landroid/support/v7/widget/AppCompatDrawableManager;I)Landroid/support/v7/widget/TintInfo;

    move-result-object v9

    iput-object v9, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableStartTint:Landroid/support/v7/widget/TintInfo;

    :cond_88
    sget v9, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextHelper_android_drawableEnd:I

    invoke-virtual {v5, v9}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v9

    if-eqz v9, :cond_9c

    sget v9, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextHelper_android_drawableEnd:I

    invoke-virtual {v5, v9, v6}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result v9

    invoke-static {v3, v4, v9}, Landroid/support/v7/widget/AppCompatTextHelper;->createTintInfo(Landroid/content/Context;Landroid/support/v7/widget/AppCompatDrawableManager;I)Landroid/support/v7/widget/TintInfo;

    move-result-object v4

    iput-object v4, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableEndTint:Landroid/support/v7/widget/TintInfo;

    :cond_9c
    invoke-virtual {v5}, Landroid/support/v7/widget/TintTypedArray;->recycle()V

    iget-object v4, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object v4

    instance-of v4, v4, Landroid/text/method/PasswordTransformationMethod;

    const/4 v5, 0x1

    const/16 v9, 0x17

    const/4 v10, 0x0

    if-eq v7, v8, :cond_109

    sget-object v11, Landroid/support/v7/appcompat/R$styleable;->TextAppearance:[I

    invoke-static {v3, v7, v11}, Landroid/support/v7/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;I[I)Landroid/support/v7/widget/TintTypedArray;

    move-result-object v7

    if-nez v4, :cond_c6

    sget v11, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_textAllCaps:I

    invoke-virtual {v7, v11}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v11

    if-eqz v11, :cond_c6

    sget v11, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_textAllCaps:I

    invoke-virtual {v7, v11, v6}, Landroid/support/v7/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v11

    move v12, v11

    const/4 v11, 0x1

    goto :goto_c8

    :cond_c6
    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_c8
    invoke-direct {v0, v3, v7}, Landroid/support/v7/widget/AppCompatTextHelper;->updateTypefaceAndStyle(Landroid/content/Context;Landroid/support/v7/widget/TintTypedArray;)V

    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v13, v9, :cond_103

    sget v13, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textColor:I

    invoke-virtual {v7, v13}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v13

    if-eqz v13, :cond_de

    sget v13, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textColor:I

    invoke-virtual {v7, v13}, Landroid/support/v7/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v13

    goto :goto_df

    :cond_de
    move-object v13, v10

    :goto_df
    sget v14, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textColorHint:I

    invoke-virtual {v7, v14}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v14

    if-eqz v14, :cond_ee

    sget v14, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textColorHint:I

    invoke-virtual {v7, v14}, Landroid/support/v7/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v14

    goto :goto_ef

    :cond_ee
    move-object v14, v10

    :goto_ef
    sget v15, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textColorLink:I

    invoke-virtual {v7, v15}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v15

    if-eqz v15, :cond_fd

    sget v10, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textColorLink:I

    invoke-virtual {v7, v10}, Landroid/support/v7/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v10

    :cond_fd
    move-object/from16 v16, v13

    move-object v13, v10

    move-object/from16 v10, v16

    goto :goto_105

    :cond_103
    move-object v13, v10

    move-object v14, v13

    :goto_105
    invoke-virtual {v7}, Landroid/support/v7/widget/TintTypedArray;->recycle()V

    goto :goto_10d

    :cond_109
    move-object v13, v10

    move-object v14, v13

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_10d
    sget-object v7, Landroid/support/v7/appcompat/R$styleable;->TextAppearance:[I

    invoke-static {v3, v1, v7, v2, v6}, Landroid/support/v7/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/widget/TintTypedArray;

    move-result-object v7

    if-nez v4, :cond_124

    sget v15, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_textAllCaps:I

    invoke-virtual {v7, v15}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v15

    if-eqz v15, :cond_124

    sget v11, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_textAllCaps:I

    invoke-virtual {v7, v11, v6}, Landroid/support/v7/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v12

    goto :goto_125

    :cond_124
    move v5, v11

    :goto_125
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v11, v9, :cond_155

    sget v9, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textColor:I

    invoke-virtual {v7, v9}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v9

    if-eqz v9, :cond_138

    sget v9, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textColor:I

    invoke-virtual {v7, v9}, Landroid/support/v7/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v9

    move-object v10, v9

    :cond_138
    sget v9, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textColorHint:I

    invoke-virtual {v7, v9}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v9

    if-eqz v9, :cond_147

    sget v9, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textColorHint:I

    invoke-virtual {v7, v9}, Landroid/support/v7/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v9

    move-object v14, v9

    :cond_147
    sget v9, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textColorLink:I

    invoke-virtual {v7, v9}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v9

    if-eqz v9, :cond_155

    sget v9, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textColorLink:I

    invoke-virtual {v7, v9}, Landroid/support/v7/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v13

    :cond_155
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x1c

    if-lt v9, v11, :cond_171

    sget v9, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textSize:I

    invoke-virtual {v7, v9}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v9

    if-eqz v9, :cond_171

    sget v9, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textSize:I

    invoke-virtual {v7, v9, v8}, Landroid/support/v7/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v9

    if-nez v9, :cond_171

    iget-object v9, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    const/4 v11, 0x0

    invoke-virtual {v9, v6, v11}, Landroid/widget/TextView;->setTextSize(IF)V

    :cond_171
    invoke-direct {v0, v3, v7}, Landroid/support/v7/widget/AppCompatTextHelper;->updateTypefaceAndStyle(Landroid/content/Context;Landroid/support/v7/widget/TintTypedArray;)V

    invoke-virtual {v7}, Landroid/support/v7/widget/TintTypedArray;->recycle()V

    if-eqz v10, :cond_17e

    iget-object v7, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_17e
    if-eqz v14, :cond_185

    iget-object v7, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v7, v14}, Landroid/widget/TextView;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    :cond_185
    if-eqz v13, :cond_18c

    iget-object v7, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v7, v13}, Landroid/widget/TextView;->setLinkTextColor(Landroid/content/res/ColorStateList;)V

    :cond_18c
    if-nez v4, :cond_193

    if-eqz v5, :cond_193

    invoke-virtual {v0, v12}, Landroid/support/v7/widget/AppCompatTextHelper;->setAllCaps(Z)V

    :cond_193
    iget-object v4, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mFontTypeface:Landroid/graphics/Typeface;

    if-eqz v4, :cond_1a0

    iget-object v4, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    iget-object v5, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mFontTypeface:Landroid/graphics/Typeface;

    iget v7, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mStyle:I

    invoke-virtual {v4, v5, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :cond_1a0
    iget-object v4, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v4, v1, v2}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->loadFromAttributes(Landroid/util/AttributeSet;I)V

    sget-boolean v2, Landroid/support/v4/widget/AutoSizeableTextView;->PLATFORM_SUPPORTS_AUTOSIZE:Z

    if-eqz v2, :cond_1e4

    iget-object v2, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->getAutoSizeTextType()I

    move-result v2

    if-eqz v2, :cond_1e4

    iget-object v2, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->getAutoSizeTextAvailableSizes()[I

    move-result-object v2

    array-length v4, v2

    if-lez v4, :cond_1e4

    iget-object v4, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getAutoSizeStepGranularity()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, -0x40800000    # -1.0f

    cmpl-float v4, v4, v5

    if-eqz v4, :cond_1df

    iget-object v2, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    iget-object v4, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->getAutoSizeMinTextSize()I

    move-result v4

    iget-object v5, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->getAutoSizeMaxTextSize()I

    move-result v5

    iget-object v7, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v7}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->getAutoSizeStepGranularity()I

    move-result v7

    invoke-virtual {v2, v4, v5, v7, v6}, Landroid/widget/TextView;->setAutoSizeTextTypeUniformWithConfiguration(IIII)V

    goto :goto_1e4

    :cond_1df
    iget-object v4, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v4, v2, v6}, Landroid/widget/TextView;->setAutoSizeTextTypeUniformWithPresetSizes([II)V

    :cond_1e4
    :goto_1e4
    sget-object v2, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextView:[I

    invoke-static {v3, v1, v2}, Landroid/support/v7/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[I)Landroid/support/v7/widget/TintTypedArray;

    move-result-object v1

    sget v2, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextView_firstBaselineToTopHeight:I

    invoke-virtual {v1, v2, v8}, Landroid/support/v7/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v2

    sget v3, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextView_lastBaselineToBottomHeight:I

    invoke-virtual {v1, v3, v8}, Landroid/support/v7/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v3

    sget v4, Landroid/support/v7/appcompat/R$styleable;->AppCompatTextView_lineHeight:I

    invoke-virtual {v1, v4, v8}, Landroid/support/v7/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v4

    invoke-virtual {v1}, Landroid/support/v7/widget/TintTypedArray;->recycle()V

    if-eq v2, v8, :cond_206

    iget-object v1, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-static {v1, v2}, Landroid/support/v4/widget/TextViewCompat;->setFirstBaselineToTopHeight(Landroid/widget/TextView;I)V

    :cond_206
    if-eq v3, v8, :cond_20d

    iget-object v1, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-static {v1, v3}, Landroid/support/v4/widget/TextViewCompat;->setLastBaselineToBottomHeight(Landroid/widget/TextView;I)V

    :cond_20d
    if-eq v4, v8, :cond_214

    iget-object v1, v0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-static {v1, v4}, Landroid/support/v4/widget/TextViewCompat;->setLineHeight(Landroid/widget/TextView;I)V

    :cond_214
    return-void
.end method

.method onAsyncTypefaceReceived(Ljava/lang/ref/WeakReference;Landroid/graphics/Typeface;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/TextView;",
            ">;",
            "Landroid/graphics/Typeface;",
            ")V"
        }
    .end annotation

    iget-boolean v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAsyncFontPending:Z

    if-eqz v0, :cond_13

    iput-object p2, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mFontTypeface:Landroid/graphics/Typeface;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    if-eqz p1, :cond_13

    iget v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mStyle:I

    invoke-virtual {p1, p2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :cond_13
    return-void
.end method

.method onLayout(ZIIII)V
    .registers 6
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    sget-boolean p1, Landroid/support/v4/widget/AutoSizeableTextView;->PLATFORM_SUPPORTS_AUTOSIZE:Z

    if-nez p1, :cond_7

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatTextHelper;->autoSizeText()V

    :cond_7
    return-void
.end method

.method onSetTextAppearance(Landroid/content/Context;I)V
    .registers 6

    sget-object v0, Landroid/support/v7/appcompat/R$styleable;->TextAppearance:[I

    invoke-static {p1, p2, v0}, Landroid/support/v7/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;I[I)Landroid/support/v7/widget/TintTypedArray;

    move-result-object p2

    sget v0, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_textAllCaps:I

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_18

    sget v0, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_textAllCaps:I

    invoke-virtual {p2, v0, v1}, Landroid/support/v7/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AppCompatTextHelper;->setAllCaps(Z)V

    :cond_18
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-ge v0, v2, :cond_33

    sget v0, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textColor:I

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_33

    sget v0, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textColor:I

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    if-eqz v0, :cond_33

    iget-object v2, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_33
    sget v0, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textSize:I

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_4a

    sget v0, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_android_textSize:I

    const/4 v2, -0x1

    invoke-virtual {p2, v0, v2}, Landroid/support/v7/widget/TintTypedArray;->getDimensionPixelSize(II)I

    move-result v0

    if-nez v0, :cond_4a

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    :cond_4a
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/AppCompatTextHelper;->updateTypefaceAndStyle(Landroid/content/Context;Landroid/support/v7/widget/TintTypedArray;)V

    invoke-virtual {p2}, Landroid/support/v7/widget/TintTypedArray;->recycle()V

    iget-object p1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mFontTypeface:Landroid/graphics/Typeface;

    if-eqz p1, :cond_5d

    iget-object p1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    iget-object p2, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mFontTypeface:Landroid/graphics/Typeface;

    iget v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mStyle:I

    invoke-virtual {p1, p2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :cond_5d
    return-void
.end method

.method setAllCaps(Z)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setAllCaps(Z)V

    return-void
.end method

.method setAutoSizeTextTypeUniformWithConfiguration(IIII)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->setAutoSizeTextTypeUniformWithConfiguration(IIII)V

    return-void
.end method

.method setAutoSizeTextTypeUniformWithPresetSizes([II)V
    .registers 4
    .param p1    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->setAutoSizeTextTypeUniformWithPresetSizes([II)V

    return-void
.end method

.method setAutoSizeTextTypeWithDefaults(I)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mAutoSizeTextHelper:Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/AppCompatTextViewAutoSizeHelper;->setAutoSizeTextTypeWithDefaults(I)V

    return-void
.end method

.method setTextSize(IF)V
    .registers 4
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    sget-boolean v0, Landroid/support/v4/widget/AutoSizeableTextView;->PLATFORM_SUPPORTS_AUTOSIZE:Z

    if-nez v0, :cond_d

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatTextHelper;->isAutoSizeEnabled()Z

    move-result v0

    if-nez v0, :cond_d

    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/AppCompatTextHelper;->setTextSizeInternal(IF)V

    :cond_d
    return-void
.end method
