.class public Landroid/support/v7/widget/AppCompatSpinner;
.super Landroid/widget/Spinner;
.source "AppCompatSpinner.java"

# interfaces
.implements Landroid/support/v4/view/TintableBackgroundView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;,
        Landroid/support/v7/widget/AppCompatSpinner$DropDownAdapter;
    }
.end annotation


# static fields
.field private static final ATTRS_ANDROID_SPINNERMODE:[I

.field private static final MAX_ITEMS_MEASURED:I = 0xf

.field private static final MODE_DIALOG:I = 0x0

.field private static final MODE_DROPDOWN:I = 0x1

.field private static final MODE_THEME:I = -0x1

.field private static final TAG:Ljava/lang/String; = "AppCompatSpinner"


# instance fields
.field private final mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

.field mDropDownWidth:I

.field private mForwardingListener:Landroid/support/v7/widget/ForwardingListener;

.field mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

.field private final mPopupContext:Landroid/content/Context;

.field private final mPopupSet:Z

.field private mTempAdapter:Landroid/widget/SpinnerAdapter;

.field final mTempRect:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10102f1

    aput v2, v0, v1

    sput-object v0, Landroid/support/v7/widget/AppCompatSpinner;->ATTRS_ANDROID_SPINNERMODE:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/AppCompatSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 5

    sget v0, Landroid/support/v7/appcompat/R$attr;->spinnerStyle:I

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0, p2}, Landroid/support/v7/widget/AppCompatSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    sget v0, Landroid/support/v7/appcompat/R$attr;->spinnerStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/AppCompatSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5

    const/4 v0, -0x1

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v7/widget/AppCompatSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 11

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/widget/AppCompatSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILandroid/content/res/Resources$Theme;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILandroid/content/res/Resources$Theme;)V
    .registers 13

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;

    sget-object v0, Landroid/support/v7/appcompat/R$styleable;->Spinner:[I

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, p3, v1}, Landroid/support/v7/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/widget/TintTypedArray;

    move-result-object v0

    new-instance v2, Landroid/support/v7/widget/AppCompatBackgroundHelper;

    invoke-direct {v2, p0}, Landroid/support/v7/widget/AppCompatBackgroundHelper;-><init>(Landroid/view/View;)V

    iput-object v2, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    const/4 v2, 0x0

    if-eqz p5, :cond_23

    new-instance v3, Landroid/support/v7/view/ContextThemeWrapper;

    invoke-direct {v3, p1, p5}, Landroid/support/v7/view/ContextThemeWrapper;-><init>(Landroid/content/Context;Landroid/content/res/Resources$Theme;)V

    iput-object v3, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopupContext:Landroid/content/Context;

    goto :goto_3e

    :cond_23
    sget p5, Landroid/support/v7/appcompat/R$styleable;->Spinner_popupTheme:I

    invoke-virtual {v0, p5, v1}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result p5

    if-eqz p5, :cond_33

    new-instance v3, Landroid/support/v7/view/ContextThemeWrapper;

    invoke-direct {v3, p1, p5}, Landroid/support/v7/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v3, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopupContext:Landroid/content/Context;

    goto :goto_3e

    :cond_33
    sget p5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-ge p5, v3, :cond_3b

    move-object p5, p1

    goto :goto_3c

    :cond_3b
    move-object p5, v2

    :goto_3c
    iput-object p5, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopupContext:Landroid/content/Context;

    :goto_3e
    iget-object p5, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopupContext:Landroid/content/Context;

    const/4 v3, 0x1

    if-eqz p5, :cond_ad

    const/4 p5, -0x1

    if-ne p4, p5, :cond_75

    :try_start_46
    sget-object p5, Landroid/support/v7/widget/AppCompatSpinner;->ATTRS_ANDROID_SPINNERMODE:[I

    invoke-virtual {p1, p2, p5, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p5
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_4c} :catch_62
    .catchall {:try_start_46 .. :try_end_4c} :catchall_5f

    :try_start_4c
    invoke-virtual {p5, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_57

    invoke-virtual {p5, v1, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_56} :catch_5d
    .catchall {:try_start_4c .. :try_end_56} :catchall_6e

    move p4, v4

    :cond_57
    if-eqz p5, :cond_75

    :goto_59
    invoke-virtual {p5}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_75

    :catch_5d
    move-exception v4

    goto :goto_64

    :catchall_5f
    move-exception p1

    move-object p5, v2

    goto :goto_6f

    :catch_62
    move-exception v4

    move-object p5, v2

    :goto_64
    :try_start_64
    const-string v5, "AppCompatSpinner"

    const-string v6, "Could not read android:spinnerMode"

    invoke-static {v5, v6, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6b
    .catchall {:try_start_64 .. :try_end_6b} :catchall_6e

    if-eqz p5, :cond_75

    goto :goto_59

    :catchall_6e
    move-exception p1

    :goto_6f
    if-eqz p5, :cond_74

    invoke-virtual {p5}, Landroid/content/res/TypedArray;->recycle()V

    :cond_74
    throw p1

    :cond_75
    :goto_75
    if-ne p4, v3, :cond_ad

    new-instance p4, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    iget-object p5, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopupContext:Landroid/content/Context;

    invoke-direct {p4, p0, p5, p2, p3}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;-><init>(Landroid/support/v7/widget/AppCompatSpinner;Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iget-object p5, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopupContext:Landroid/content/Context;

    sget-object v4, Landroid/support/v7/appcompat/R$styleable;->Spinner:[I

    invoke-static {p5, p2, v4, p3, v1}, Landroid/support/v7/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/widget/TintTypedArray;

    move-result-object p5

    sget v1, Landroid/support/v7/appcompat/R$styleable;->Spinner_android_dropDownWidth:I

    const/4 v4, -0x2

    invoke-virtual {p5, v1, v4}, Landroid/support/v7/widget/TintTypedArray;->getLayoutDimension(II)I

    move-result v1

    iput v1, p0, Landroid/support/v7/widget/AppCompatSpinner;->mDropDownWidth:I

    sget v1, Landroid/support/v7/appcompat/R$styleable;->Spinner_android_popupBackground:I

    invoke-virtual {p5, v1}, Landroid/support/v7/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p4, v1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    sget v1, Landroid/support/v7/appcompat/R$styleable;->Spinner_android_prompt:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/TintTypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p4, v1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setPromptText(Ljava/lang/CharSequence;)V

    invoke-virtual {p5}, Landroid/support/v7/widget/TintTypedArray;->recycle()V

    iput-object p4, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    new-instance p5, Landroid/support/v7/widget/AppCompatSpinner$1;

    invoke-direct {p5, p0, p0, p4}, Landroid/support/v7/widget/AppCompatSpinner$1;-><init>(Landroid/support/v7/widget/AppCompatSpinner;Landroid/view/View;Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;)V

    iput-object p5, p0, Landroid/support/v7/widget/AppCompatSpinner;->mForwardingListener:Landroid/support/v7/widget/ForwardingListener;

    :cond_ad
    sget p4, Landroid/support/v7/appcompat/R$styleable;->Spinner_android_entries:I

    invoke-virtual {v0, p4}, Landroid/support/v7/widget/TintTypedArray;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object p4

    if-eqz p4, :cond_c5

    new-instance p5, Landroid/widget/ArrayAdapter;

    const v1, 0x1090008

    invoke-direct {p5, p1, v1, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    sget p1, Landroid/support/v7/appcompat/R$layout;->support_simple_spinner_dropdown_item:I

    invoke-virtual {p5, p1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    invoke-virtual {p0, p5}, Landroid/support/v7/widget/AppCompatSpinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    :cond_c5
    invoke-virtual {v0}, Landroid/support/v7/widget/TintTypedArray;->recycle()V

    iput-boolean v3, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopupSet:Z

    iget-object p1, p0, Landroid/support/v7/widget/AppCompatSpinner;->mTempAdapter:Landroid/widget/SpinnerAdapter;

    if-eqz p1, :cond_d5

    iget-object p1, p0, Landroid/support/v7/widget/AppCompatSpinner;->mTempAdapter:Landroid/widget/SpinnerAdapter;

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AppCompatSpinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    iput-object v2, p0, Landroid/support/v7/widget/AppCompatSpinner;->mTempAdapter:Landroid/widget/SpinnerAdapter;

    :cond_d5
    iget-object p1, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    invoke-virtual {p1, p2, p3}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->loadFromAttributes(Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method compatMeasureContentWidth(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I
    .registers 13

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner;->getMeasuredWidth()I

    move-result v1

    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner;->getMeasuredHeight()I

    move-result v2

    invoke-static {v2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner;->getSelectedItemPosition()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-interface {p1}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v4

    add-int/lit8 v5, v3, 0xf

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    sub-int v5, v4, v3

    rsub-int/lit8 v5, v5, 0xf

    sub-int/2addr v3, v5

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/4 v5, 0x0

    move-object v6, v5

    const/4 v7, 0x0

    :goto_32
    if-ge v3, v4, :cond_5d

    invoke-interface {p1, v3}, Landroid/widget/SpinnerAdapter;->getItemViewType(I)I

    move-result v8

    if-eq v8, v0, :cond_3c

    move-object v6, v5

    move v0, v8

    :cond_3c
    invoke-interface {p1, v3, v6, p0}, Landroid/widget/SpinnerAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    if-nez v8, :cond_4f

    new-instance v8, Landroid/view/ViewGroup$LayoutParams;

    const/4 v9, -0x2

    invoke-direct {v8, v9, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_4f
    invoke-virtual {v6, v1, v2}, Landroid/view/View;->measure(II)V

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    add-int/lit8 v3, v3, 0x1

    goto :goto_32

    :cond_5d
    if-eqz p2, :cond_6e

    iget-object p1, p0, Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget-object p1, p0, Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->left:I

    iget-object p2, p0, Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;

    iget p2, p2, Landroid/graphics/Rect;->right:I

    add-int/2addr p1, p2

    add-int/2addr v7, p1

    :cond_6e
    return v7
.end method

.method protected drawableStateChanged()V
    .registers 2

    invoke-super {p0}, Landroid/widget/Spinner;->drawableStateChanged()V

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    if-eqz v0, :cond_c

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->applySupportBackgroundTint()V

    :cond_c
    return-void
.end method

.method public getDropDownHorizontalOffset()I
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->getHorizontalOffset()I

    move-result v0

    return v0

    :cond_b
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_16

    invoke-super {p0}, Landroid/widget/Spinner;->getDropDownHorizontalOffset()I

    move-result v0

    return v0

    :cond_16
    const/4 v0, 0x0

    return v0
.end method

.method public getDropDownVerticalOffset()I
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->getVerticalOffset()I

    move-result v0

    return v0

    :cond_b
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_16

    invoke-super {p0}, Landroid/widget/Spinner;->getDropDownVerticalOffset()I

    move-result v0

    return v0

    :cond_16
    const/4 v0, 0x0

    return v0
.end method

.method public getDropDownWidth()I
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz v0, :cond_7

    iget v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mDropDownWidth:I

    return v0

    :cond_7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_12

    invoke-super {p0}, Landroid/widget/Spinner;->getDropDownWidth()I

    move-result v0

    return v0

    :cond_12
    const/4 v0, 0x0

    return v0
.end method

.method public getPopupBackground()Landroid/graphics/drawable/Drawable;
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0

    :cond_b
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_16

    invoke-super {p0}, Landroid/widget/Spinner;->getPopupBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0

    :cond_16
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPopupContext()Landroid/content/Context;
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz v0, :cond_7

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopupContext:Landroid/content/Context;

    return-object v0

    :cond_7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_12

    invoke-super {p0}, Landroid/widget/Spinner;->getPopupContext()Landroid/content/Context;

    move-result-object v0

    return-object v0

    :cond_12
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPrompt()Ljava/lang/CharSequence;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->getHintText()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_f

    :cond_b
    invoke-super {p0}, Landroid/widget/Spinner;->getPrompt()Ljava/lang/CharSequence;

    move-result-object v0

    :goto_f
    return-object v0
.end method

.method public getSupportBackgroundTintList()Landroid/content/res/ColorStateList;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->getSupportBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return-object v0
.end method

.method public getSupportBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->getSupportBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return-object v0
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/widget/Spinner;->onDetachedFromWindow()V

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz v0, :cond_14

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->dismiss()V

    :cond_14
    return-void
.end method

.method protected onMeasure(II)V
    .registers 5

    invoke-super {p0, p1, p2}, Landroid/widget/Spinner;->onMeasure(II)V

    iget-object p2, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz p2, :cond_32

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p2

    const/high16 v0, -0x80000000

    if-ne p2, v0, :cond_32

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner;->getMeasuredWidth()I

    move-result p2

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v0

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/AppCompatSpinner;->compatMeasureContentWidth(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner;->getMeasuredHeight()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/AppCompatSpinner;->setMeasuredDimension(II)V

    :cond_32
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mForwardingListener:Landroid/support/v7/widget/ForwardingListener;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mForwardingListener:Landroid/support/v7/widget/ForwardingListener;

    invoke-virtual {v0, p0, p1}, Landroid/support/v7/widget/ForwardingListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 p1, 0x1

    return p1

    :cond_e
    invoke-super {p0, p1}, Landroid/widget/Spinner;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public performClick()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz v0, :cond_13

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->isShowing()Z

    move-result v0

    if-nez v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->show()V

    :cond_11
    const/4 v0, 0x1

    return v0

    :cond_13
    invoke-super {p0}, Landroid/widget/Spinner;->performClick()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .registers 2

    check-cast p1, Landroid/widget/SpinnerAdapter;

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AppCompatSpinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/SpinnerAdapter;)V
    .registers 5

    iget-boolean v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopupSet:Z

    if-nez v0, :cond_7

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatSpinner;->mTempAdapter:Landroid/widget/SpinnerAdapter;

    return-void

    :cond_7
    invoke-super {p0, p1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz v0, :cond_27

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopupContext:Landroid/content/Context;

    if-nez v0, :cond_17

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner;->getContext()Landroid/content/Context;

    move-result-object v0

    goto :goto_19

    :cond_17
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopupContext:Landroid/content/Context;

    :goto_19
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    new-instance v2, Landroid/support/v7/widget/AppCompatSpinner$DropDownAdapter;

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    invoke-direct {v2, p1, v0}, Landroid/support/v7/widget/AppCompatSpinner$DropDownAdapter;-><init>(Landroid/widget/SpinnerAdapter;Landroid/content/res/Resources$Theme;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setAdapter(Landroid/widget/ListAdapter;)V

    :cond_27
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    invoke-super {p0, p1}, Landroid/widget/Spinner;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    if-eqz v0, :cond_c

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->onSetBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_c
    return-void
.end method

.method public setBackgroundResource(I)V
    .registers 3
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    invoke-super {p0, p1}, Landroid/widget/Spinner;->setBackgroundResource(I)V

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    if-eqz v0, :cond_c

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->onSetBackgroundResource(I)V

    :cond_c
    return-void
.end method

.method public setDropDownHorizontalOffset(I)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz v0, :cond_a

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setHorizontalOffset(I)V

    goto :goto_13

    :cond_a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_13

    invoke-super {p0, p1}, Landroid/widget/Spinner;->setDropDownHorizontalOffset(I)V

    :cond_13
    :goto_13
    return-void
.end method

.method public setDropDownVerticalOffset(I)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz v0, :cond_a

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setVerticalOffset(I)V

    goto :goto_13

    :cond_a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_13

    invoke-super {p0, p1}, Landroid/widget/Spinner;->setDropDownVerticalOffset(I)V

    :cond_13
    :goto_13
    return-void
.end method

.method public setDropDownWidth(I)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz v0, :cond_7

    iput p1, p0, Landroid/support/v7/widget/AppCompatSpinner;->mDropDownWidth:I

    goto :goto_10

    :cond_7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_10

    invoke-super {p0, p1}, Landroid/widget/Spinner;->setDropDownWidth(I)V

    :cond_10
    :goto_10
    return-void
.end method

.method public setPopupBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz v0, :cond_a

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_13

    :cond_a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_13

    invoke-super {p0, p1}, Landroid/widget/Spinner;->setPopupBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_13
    :goto_13
    return-void
.end method

.method public setPopupBackgroundResource(I)V
    .registers 3
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner;->getPopupContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v7/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AppCompatSpinner;->setPopupBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setPrompt(Ljava/lang/CharSequence;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    if-eqz v0, :cond_a

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mPopup:Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setPromptText(Ljava/lang/CharSequence;)V

    goto :goto_d

    :cond_a
    invoke-super {p0, p1}, Landroid/widget/Spinner;->setPrompt(Ljava/lang/CharSequence;)V

    :goto_d
    return-void
.end method

.method public setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p1    # Landroid/content/res/ColorStateList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V

    :cond_9
    return-void
.end method

.method public setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3
    .param p1    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner;->mBackgroundTintHelper:Landroid/support/v7/widget/AppCompatBackgroundHelper;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    :cond_9
    return-void
.end method
