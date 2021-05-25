.class public Landroid/support/v4/graphics/drawable/IconCompat;
.super Landroidx/versionedparcelable/CustomVersionedParcelable;
.source "IconCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/graphics/drawable/IconCompat$IconType;
    }
.end annotation


# static fields
.field private static final ADAPTIVE_ICON_INSET_FACTOR:F = 0.25f

.field private static final AMBIENT_SHADOW_ALPHA:I = 0x1e

.field private static final BLUR_FACTOR:F = 0.010416667f

.field static final DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

.field private static final DEFAULT_VIEW_PORT_SCALE:F = 0.6666667f

.field private static final EXTRA_INT1:Ljava/lang/String; = "int1"

.field private static final EXTRA_INT2:Ljava/lang/String; = "int2"

.field private static final EXTRA_OBJ:Ljava/lang/String; = "obj"

.field private static final EXTRA_TINT_LIST:Ljava/lang/String; = "tint_list"

.field private static final EXTRA_TINT_MODE:Ljava/lang/String; = "tint_mode"

.field private static final EXTRA_TYPE:Ljava/lang/String; = "type"

.field private static final ICON_DIAMETER_FACTOR:F = 0.9166667f

.field private static final KEY_SHADOW_ALPHA:I = 0x3d

.field private static final KEY_SHADOW_OFFSET_FACTOR:F = 0.020833334f

.field private static final TAG:Ljava/lang/String; = "IconCompat"

.field public static final TYPE_UNKNOWN:I = -0x1


# instance fields
.field public mData:[B
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field public mInt1:I
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field public mInt2:I
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field mObj1:Ljava/lang/Object;

.field public mParcelable:Landroid/os/Parcelable;
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field public mTintList:Landroid/content/res/ColorStateList;
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field mTintMode:Landroid/graphics/PorterDuff$Mode;

.field public mTintModeStr:Ljava/lang/String;
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field public mType:I
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    sput-object v0, Landroid/support/v4/graphics/drawable/IconCompat;->DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

    return-void
.end method

.method public constructor <init>()V
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    invoke-direct {p0}, Landroidx/versionedparcelable/CustomVersionedParcelable;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    sget-object v0, Landroid/support/v4/graphics/drawable/IconCompat;->DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    return-void
.end method

.method private constructor <init>(I)V
    .registers 3

    invoke-direct {p0}, Landroidx/versionedparcelable/CustomVersionedParcelable;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    sget-object v0, Landroid/support/v4/graphics/drawable/IconCompat;->DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    iput p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    return-void
.end method

.method public static createFromBundle(Landroid/os/Bundle;)Landroid/support/v4/graphics/drawable/IconCompat;
    .registers 4
    .param p0    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const-string v0, "type"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    new-instance v1, Landroid/support/v4/graphics/drawable/IconCompat;

    invoke-direct {v1, v0}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    const-string v2, "int1"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    const-string v2, "int2"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    const-string v2, "tint_list"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2d

    const-string v2, "tint_list"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/content/res/ColorStateList;

    iput-object v2, v1, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    :cond_2d
    const-string v2, "tint_mode"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_41

    const-string v2, "tint_mode"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/PorterDuff$Mode;->valueOf(Ljava/lang/String;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v2

    iput-object v2, v1, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    :cond_41
    const/4 v2, -0x1

    if-eq v0, v2, :cond_71

    packed-switch v0, :pswitch_data_7a

    const-string p0, "IconCompat"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0

    :pswitch_5f
    const-string v0, "obj"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object p0

    iput-object p0, v1, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    goto :goto_79

    :pswitch_68
    const-string v0, "obj"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    goto :goto_79

    :cond_71
    :pswitch_71
    const-string v0, "obj"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p0

    iput-object p0, v1, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    :goto_79
    return-object v1

    :pswitch_data_7a
    .packed-switch 0x1
        :pswitch_71
        :pswitch_68
        :pswitch_5f
        :pswitch_68
        :pswitch_71
    .end packed-switch
.end method

.method public static createFromIcon(Landroid/content/Context;Landroid/graphics/drawable/Icon;)Landroid/support/v4/graphics/drawable/IconCompat;
    .registers 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/graphics/drawable/Icon;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x17
    .end annotation

    invoke-static {p1}, Landroid/support/v4/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1}, Landroid/support/v4/graphics/drawable/IconCompat;->getType(Landroid/graphics/drawable/Icon;)I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1f

    const/4 p0, 0x4

    if-eq v0, p0, :cond_16

    new-instance p0, Landroid/support/v4/graphics/drawable/IconCompat;

    const/4 v0, -0x1

    invoke-direct {p0, v0}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    return-object p0

    :cond_16
    invoke-static {p1}, Landroid/support/v4/graphics/drawable/IconCompat;->getUri(Landroid/graphics/drawable/Icon;)Landroid/net/Uri;

    move-result-object p0

    invoke-static {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->createWithContentUri(Landroid/net/Uri;)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object p0

    return-object p0

    :cond_1f
    invoke-static {p1}, Landroid/support/v4/graphics/drawable/IconCompat;->getResPackage(Landroid/graphics/drawable/Icon;)Ljava/lang/String;

    move-result-object v0

    :try_start_23
    invoke-static {p0, v0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResources(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p1}, Landroid/support/v4/graphics/drawable/IconCompat;->getResId(Landroid/graphics/drawable/Icon;)I

    move-result p1

    invoke-static {p0, v0, p1}, Landroid/support/v4/graphics/drawable/IconCompat;->createWithResource(Landroid/content/res/Resources;Ljava/lang/String;I)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object p0
    :try_end_2f
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_23 .. :try_end_2f} :catch_30

    return-object p0

    :catch_30
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Icon resource cannot be found"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createFromIcon(Landroid/graphics/drawable/Icon;)Landroid/support/v4/graphics/drawable/IconCompat;
    .registers 3
    .param p0    # Landroid/graphics/drawable/Icon;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x17
    .end annotation

    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    invoke-static {p0}, Landroid/support/v4/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getType(Landroid/graphics/drawable/Icon;)I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1f

    const/4 v1, 0x4

    if-eq v0, v1, :cond_16

    new-instance v0, Landroid/support/v4/graphics/drawable/IconCompat;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    iput-object p0, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    return-object v0

    :cond_16
    invoke-static {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getUri(Landroid/graphics/drawable/Icon;)Landroid/net/Uri;

    move-result-object p0

    invoke-static {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->createWithContentUri(Landroid/net/Uri;)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object p0

    return-object p0

    :cond_1f
    const/4 v0, 0x0

    invoke-static {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResPackage(Landroid/graphics/drawable/Icon;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResId(Landroid/graphics/drawable/Icon;)I

    move-result p0

    invoke-static {v0, v1, p0}, Landroid/support/v4/graphics/drawable/IconCompat;->createWithResource(Landroid/content/res/Resources;Ljava/lang/String;I)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object p0

    return-object p0
.end method

.method static createLegacyIconFromAdaptiveIcon(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
    .registers 11
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3f2aaaab

    mul-float v0, v0, v1

    float-to-int v0, v0

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v3, Landroid/graphics/Paint;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Landroid/graphics/Paint;-><init>(I)V

    int-to-float v4, v0

    const/high16 v5, 0x3f000000    # 0.5f

    mul-float v5, v5, v4

    const v6, 0x3f6aaaab

    mul-float v6, v6, v5

    if-eqz p1, :cond_52

    const p1, 0x3c2aaaab

    mul-float p1, p1, v4

    const/4 v7, 0x0

    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setColor(I)V

    const v7, 0x3caaaaab

    mul-float v4, v4, v7

    const/high16 v7, 0x3d000000    # 0.03125f

    const/4 v8, 0x0

    invoke-virtual {v3, p1, v8, v4, v7}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    invoke-virtual {v2, v5, v5, v6, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x1e000000

    invoke-virtual {v3, p1, v8, v8, v4}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    invoke-virtual {v2, v5, v5, v6, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    invoke-virtual {v3}, Landroid/graphics/Paint;->clearShadowLayer()V

    :cond_52
    const/high16 p1, -0x1000000

    invoke-virtual {v3, p1}, Landroid/graphics/Paint;->setColor(I)V

    new-instance p1, Landroid/graphics/BitmapShader;

    sget-object v4, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {p1, p0, v4, v7}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    sub-int/2addr v7, v0

    neg-int v7, v7

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    sub-int/2addr p0, v0

    neg-int p0, p0

    div-int/lit8 p0, p0, 0x2

    int-to-float p0, p0

    invoke-virtual {v4, v7, p0}, Landroid/graphics/Matrix;->setTranslate(FF)V

    invoke-virtual {p1, v4}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    invoke-virtual {v3, p1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    invoke-virtual {v2, v5, v5, v6, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/4 p0, 0x0

    invoke-virtual {v2, p0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    return-object v1
.end method

.method public static createWithAdaptiveBitmap(Landroid/graphics/Bitmap;)Landroid/support/v4/graphics/drawable/IconCompat;
    .registers 3

    if-eqz p0, :cond_b

    new-instance v0, Landroid/support/v4/graphics/drawable/IconCompat;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    iput-object p0, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    return-object v0

    :cond_b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Bitmap must not be null."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createWithBitmap(Landroid/graphics/Bitmap;)Landroid/support/v4/graphics/drawable/IconCompat;
    .registers 3

    if-eqz p0, :cond_b

    new-instance v0, Landroid/support/v4/graphics/drawable/IconCompat;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    iput-object p0, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    return-object v0

    :cond_b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Bitmap must not be null."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createWithContentUri(Landroid/net/Uri;)Landroid/support/v4/graphics/drawable/IconCompat;
    .registers 2

    if-eqz p0, :cond_b

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->createWithContentUri(Ljava/lang/String;)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object p0

    return-object p0

    :cond_b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Uri must not be null."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createWithContentUri(Ljava/lang/String;)Landroid/support/v4/graphics/drawable/IconCompat;
    .registers 3

    if-eqz p0, :cond_b

    new-instance v0, Landroid/support/v4/graphics/drawable/IconCompat;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    iput-object p0, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    return-object v0

    :cond_b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Uri must not be null."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createWithData([BII)Landroid/support/v4/graphics/drawable/IconCompat;
    .registers 5

    if-eqz p0, :cond_f

    new-instance v0, Landroid/support/v4/graphics/drawable/IconCompat;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    iput-object p0, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    iput p1, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    iput p2, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    return-object v0

    :cond_f
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Data must not be null."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createWithResource(Landroid/content/Context;I)Landroid/support/v4/graphics/drawable/IconCompat;
    .registers 3
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    if-eqz p0, :cond_f

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0, p1}, Landroid/support/v4/graphics/drawable/IconCompat;->createWithResource(Landroid/content/res/Resources;Ljava/lang/String;I)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object p0

    return-object p0

    :cond_f
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Context must not be null."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static createWithResource(Landroid/content/res/Resources;Ljava/lang/String;I)Landroid/support/v4/graphics/drawable/IconCompat;
    .registers 5
    .param p2    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    if-eqz p1, :cond_28

    if-eqz p2, :cond_20

    new-instance v0, Landroid/support/v4/graphics/drawable/IconCompat;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/support/v4/graphics/drawable/IconCompat;-><init>(I)V

    iput p2, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    if-eqz p0, :cond_1d

    :try_start_e
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;
    :try_end_14
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_e .. :try_end_14} :catch_15

    goto :goto_1f

    :catch_15
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Icon resource cannot be found"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1d
    iput-object p1, v0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    :goto_1f
    return-object v0

    :cond_20
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Drawable resource ID must not be 0"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_28
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Package must not be null."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static getResId(Landroid/graphics/drawable/Icon;)I
    .registers 5
    .param p0    # Landroid/graphics/drawable/Icon;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation

    .annotation build Landroid/support/annotation/IdRes;
    .end annotation

    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x17
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_b

    invoke-virtual {p0}, Landroid/graphics/drawable/Icon;->getResId()I

    move-result p0

    return p0

    :cond_b
    const/4 v0, 0x0

    :try_start_c
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getResId"

    new-array v3, v0, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v0, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_24
    .catch Ljava/lang/IllegalAccessException; {:try_start_c .. :try_end_24} :catch_37
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_c .. :try_end_24} :catch_2e
    .catch Ljava/lang/NoSuchMethodException; {:try_start_c .. :try_end_24} :catch_25

    return p0

    :catch_25
    move-exception p0

    const-string v1, "IconCompat"

    const-string v2, "Unable to get icon resource"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0

    :catch_2e
    move-exception p0

    const-string v1, "IconCompat"

    const-string v2, "Unable to get icon resource"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0

    :catch_37
    move-exception p0

    const-string v1, "IconCompat"

    const-string v2, "Unable to get icon resource"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method private static getResPackage(Landroid/graphics/drawable/Icon;)Ljava/lang/String;
    .registers 6
    .param p0    # Landroid/graphics/drawable/Icon;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x17
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_b

    invoke-virtual {p0}, Landroid/graphics/drawable/Icon;->getResPackage()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_b
    const/4 v0, 0x0

    :try_start_c
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getResPackage"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_21
    .catch Ljava/lang/IllegalAccessException; {:try_start_c .. :try_end_21} :catch_34
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_c .. :try_end_21} :catch_2b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_c .. :try_end_21} :catch_22

    return-object p0

    :catch_22
    move-exception p0

    const-string v1, "IconCompat"

    const-string v2, "Unable to get icon package"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0

    :catch_2b
    move-exception p0

    const-string v1, "IconCompat"

    const-string v2, "Unable to get icon package"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0

    :catch_34
    move-exception p0

    const-string v1, "IconCompat"

    const-string v2, "Unable to get icon package"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0
.end method

.method private static getResources(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/Resources;
    .registers 7

    const-string v0, "android"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object p0

    return-object p0

    :cond_d
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/16 v0, 0x2000

    const/4 v1, 0x0

    :try_start_14
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    if-eqz v0, :cond_1f

    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Landroid/content/pm/ApplicationInfo;)Landroid/content/res/Resources;

    move-result-object p0
    :try_end_1e
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_14 .. :try_end_1e} :catch_20

    return-object p0

    :cond_1f
    return-object v1

    :catch_20
    move-exception p0

    const-string v0, "IconCompat"

    const-string v2, "Unable to find pkg=%s for icon"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v1
.end method

.method private static getType(Landroid/graphics/drawable/Icon;)I
    .registers 6
    .param p0    # Landroid/graphics/drawable/Icon;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x17
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_b

    invoke-virtual {p0}, Landroid/graphics/drawable/Icon;->getType()I

    move-result p0

    return p0

    :cond_b
    const/4 v0, -0x1

    :try_start_c
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getType"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1
    :try_end_25
    .catch Ljava/lang/IllegalAccessException; {:try_start_c .. :try_end_25} :catch_56
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_c .. :try_end_25} :catch_3e
    .catch Ljava/lang/NoSuchMethodException; {:try_start_c .. :try_end_25} :catch_26

    return v1

    :catch_26
    move-exception v1

    const-string v2, "IconCompat"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to get icon type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0

    :catch_3e
    move-exception v1

    const-string v2, "IconCompat"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to get icon type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0

    :catch_56
    move-exception v1

    const-string v2, "IconCompat"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to get icon type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v0
.end method

.method private static getUri(Landroid/graphics/drawable/Icon;)Landroid/net/Uri;
    .registers 6
    .param p0    # Landroid/graphics/drawable/Icon;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x17
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_b

    invoke-virtual {p0}, Landroid/graphics/drawable/Icon;->getUri()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_b
    const/4 v0, 0x0

    :try_start_c
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getUri"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/Uri;
    :try_end_21
    .catch Ljava/lang/IllegalAccessException; {:try_start_c .. :try_end_21} :catch_34
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_c .. :try_end_21} :catch_2b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_c .. :try_end_21} :catch_22

    return-object p0

    :catch_22
    move-exception p0

    const-string v1, "IconCompat"

    const-string v2, "Unable to get icon uri"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0

    :catch_2b
    move-exception p0

    const-string v1, "IconCompat"

    const-string v2, "Unable to get icon uri"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0

    :catch_34
    move-exception p0

    const-string v1, "IconCompat"

    const-string v2, "Unable to get icon uri"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0
.end method

.method private loadDrawableInner(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 8

    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_f0

    goto/16 :goto_ee

    :pswitch_9
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Bitmap;

    invoke-static {v2, v1}, Landroid/support/v4/graphics/drawable/IconCompat;->createLegacyIconFromAdaptiveIcon(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object v0

    :pswitch_1b
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string v3, "content"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5f

    const-string v3, "file"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    goto :goto_5f

    :cond_38
    :try_start_38
    new-instance v1, Ljava/io/FileInputStream;

    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_46
    .catch Ljava/io/FileNotFoundException; {:try_start_38 .. :try_end_46} :catch_47

    goto :goto_80

    :catch_47
    move-exception v1

    const-string v3, "IconCompat"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to load image from path: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7f

    :cond_5f
    :goto_5f
    :try_start_5f
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_67} :catch_68

    goto :goto_80

    :catch_68
    move-exception v1

    const-string v3, "IconCompat"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to load image from URI: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_7f
    move-object v1, v2

    :goto_80
    if-eqz v1, :cond_ee

    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object v0

    :pswitch_90
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v1, [B

    iget v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    iget v3, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    invoke-static {v1, v2, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object v0

    :pswitch_a6
    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResPackage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_b4

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    :cond_b4
    invoke-static {p1, v0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResources(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v0

    :try_start_b8
    iget v3, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    invoke-static {v0, v3, p1}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_c2
    .catch Ljava/lang/RuntimeException; {:try_start_b8 .. :try_end_c2} :catch_c3

    return-object p1

    :catch_c3
    move-exception p1

    const-string v0, "IconCompat"

    const-string v3, "Unable to load resource 0x%08x from pkg=%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget v5, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    const/4 v1, 0x1

    iget-object v5, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    aput-object v5, v4, v1

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_ee

    :pswitch_e0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-direct {v0, p1, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object v0

    :cond_ee
    :goto_ee
    return-object v2

    nop

    :pswitch_data_f0
    .packed-switch 0x1
        :pswitch_e0
        :pswitch_a6
        :pswitch_90
        :pswitch_1b
        :pswitch_9
    .end packed-switch
.end method

.method private static typeToString(I)Ljava/lang/String;
    .registers 1

    packed-switch p0, :pswitch_data_16

    const-string p0, "UNKNOWN"

    return-object p0

    :pswitch_6
    const-string p0, "BITMAP_MASKABLE"

    return-object p0

    :pswitch_9
    const-string p0, "URI"

    return-object p0

    :pswitch_c
    const-string p0, "DATA"

    return-object p0

    :pswitch_f
    const-string p0, "RESOURCE"

    return-object p0

    :pswitch_12
    const-string p0, "BITMAP"

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_12
        :pswitch_f
        :pswitch_c
        :pswitch_9
        :pswitch_6
    .end packed-switch
.end method


# virtual methods
.method public addToShortcutIntent(Landroid/content/Intent;Landroid/graphics/drawable/Drawable;Landroid/content/Context;)V
    .registers 8
    .param p1    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    invoke-virtual {p0, p3}, Landroid/support/v4/graphics/drawable/IconCompat;->checkResource(Landroid/content/Context;)V

    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, 0x5

    const/4 v2, 0x1

    if-eq v0, v1, :cond_9c

    packed-switch v0, :pswitch_data_c4

    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Icon type not supported for intent shortcuts"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_14
    :try_start_14
    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResPackage()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object p3

    if-nez p2, :cond_2b

    const-string p2, "android.intent.extra.shortcut.ICON_RESOURCE"

    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    invoke-static {p3, v0}, Landroid/content/Intent$ShortcutIconResource;->fromContext(Landroid/content/Context;I)Landroid/content/Intent$ShortcutIconResource;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-void

    :cond_2b
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    invoke-static {p3, v0}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    if-lez v2, :cond_4d

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    if-gtz v2, :cond_3e

    goto :goto_4d

    :cond_3e
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p3

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p3, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p3

    goto :goto_5f

    :cond_4d
    :goto_4d
    const-string v2, "activity"

    invoke-virtual {p3, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/app/ActivityManager;

    invoke-virtual {p3}, Landroid/app/ActivityManager;->getLauncherLargeIconSize()I

    move-result p3

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p3, p3, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p3

    :goto_5f
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-virtual {v0, v1, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, p3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
    :try_end_72
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_14 .. :try_end_72} :catch_73

    goto :goto_a4

    :catch_73
    move-exception p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Can\'t find package "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, p3, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :pswitch_8d
    iget-object p3, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast p3, Landroid/graphics/Bitmap;

    if-eqz p2, :cond_a4

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    invoke-virtual {p3, v0, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p3

    goto :goto_a4

    :cond_9c
    iget-object p3, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast p3, Landroid/graphics/Bitmap;

    invoke-static {p3, v2}, Landroid/support/v4/graphics/drawable/IconCompat;->createLegacyIconFromAdaptiveIcon(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    move-result-object p3

    :cond_a4
    :goto_a4
    if-eqz p2, :cond_bd

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    div-int/lit8 v2, v0, 0x2

    div-int/lit8 v3, v1, 0x2

    invoke-virtual {p2, v2, v3, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_bd
    const-string p2, "android.intent.extra.shortcut.ICON"

    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    return-void

    nop

    :pswitch_data_c4
    .packed-switch 0x1
        :pswitch_8d
        :pswitch_14
    .end packed-switch
.end method

.method public checkResource(Landroid/content/Context;)V
    .registers 9
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_61

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_12

    return-void

    :cond_12
    const-string v1, ":"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x1

    aget-object v1, v1, v3

    const-string v4, "/"

    invoke-virtual {v1, v4, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v4, v4, v5

    const-string v6, "/"

    invoke-virtual {v1, v6, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, v3

    const-string v3, ":"

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v5

    invoke-static {p1, v0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResources(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v1, v4, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    iget v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    if-eq v2, p1, :cond_61

    const-string v2, "IconCompat"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Id has changed for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iput p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    :cond_61
    return-void
.end method

.method public getResId()I
    .registers 4
    .annotation build Landroid/support/annotation/IdRes;
    .end annotation

    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_14

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_14

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/Icon;

    invoke-static {v0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResId(Landroid/graphics/drawable/Icon;)I

    move-result v0

    return v0

    :cond_14
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1c

    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    return v0

    :cond_1c
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "called getResId() on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getResPackage()Ljava/lang/String;
    .registers 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_14

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v0, v2, :cond_14

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/Icon;

    invoke-static {v0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResPackage(Landroid/graphics/drawable/Icon;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_14
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_27

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-string v2, ":"

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0

    :cond_27
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "called getResPackage() on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getType()I
    .registers 3

    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_14

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_14

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/Icon;

    invoke-static {v0}, Landroid/support/v4/graphics/drawable/IconCompat;->getType(Landroid/graphics/drawable/Icon;)I

    move-result v0

    return v0

    :cond_14
    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    return v0
.end method

.method public getUri()Landroid/net/Uri;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_14

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_14

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/Icon;

    invoke-static {v0}, Landroid/support/v4/graphics/drawable/IconCompat;->getUri(Landroid/graphics/drawable/Icon;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    :cond_14
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 4

    invoke-virtual {p0, p1}, Landroid/support/v4/graphics/drawable/IconCompat;->checkResource(Landroid/content/Context;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_12

    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->toIcon()Landroid/graphics/drawable/Icon;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1

    :cond_12
    invoke-direct {p0, p1}, Landroid/support/v4/graphics/drawable/IconCompat;->loadDrawableInner(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_2f

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    if-nez v0, :cond_22

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    sget-object v1, Landroid/support/v4/graphics/drawable/IconCompat;->DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

    if-eq v0, v1, :cond_2f

    :cond_22
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    invoke-static {p1, v0}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    invoke-static {p1, v0}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTintMode(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    :cond_2f
    return-object p1
.end method

.method public onPostParceling()V
    .registers 4

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintModeStr:Ljava/lang/String;

    invoke-static {v0}, Landroid/graphics/PorterDuff$Mode;->valueOf(Ljava/lang/String;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_3f

    packed-switch v0, :pswitch_data_50

    goto :goto_47

    :pswitch_11
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    goto :goto_47

    :pswitch_16
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    const-string v2, "UTF-16"

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    goto :goto_47

    :pswitch_26
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mParcelable:Landroid/os/Parcelable;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mParcelable:Landroid/os/Parcelable;

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    goto :goto_47

    :cond_2f
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    const/4 v0, 0x3

    iput v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    array-length v0, v0

    iput v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    goto :goto_47

    :cond_3f
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mParcelable:Landroid/os/Parcelable;

    if-eqz v0, :cond_48

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mParcelable:Landroid/os/Parcelable;

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    :goto_47
    return-void

    :cond_48
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid icon"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_50
    .packed-switch 0x1
        :pswitch_26
        :pswitch_16
        :pswitch_11
        :pswitch_16
        :pswitch_26
    .end packed-switch
.end method

.method public onPreParceling(Z)V
    .registers 5

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0}, Landroid/graphics/PorterDuff$Mode;->name()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintModeStr:Ljava/lang/String;

    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_5c

    packed-switch v0, :pswitch_data_6e

    goto :goto_64

    :pswitch_11
    iget-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "UTF-16"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    goto :goto_64

    :pswitch_24
    iget-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast p1, [B

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    goto :goto_64

    :pswitch_2b
    iget-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    const-string v0, "UTF-16"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    goto :goto_64

    :pswitch_3c
    if-eqz p1, :cond_55

    iget-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/Bitmap;

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x5a

    invoke-virtual {p1, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mData:[B

    goto :goto_64

    :cond_55
    iget-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast p1, Landroid/os/Parcelable;

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mParcelable:Landroid/os/Parcelable;

    goto :goto_64

    :cond_5c
    if-nez p1, :cond_65

    iget-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast p1, Landroid/os/Parcelable;

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mParcelable:Landroid/os/Parcelable;

    :goto_64
    return-void

    :cond_65
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Can\'t serialize Icon created with IconCompat#createFromIcon"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    nop

    :pswitch_data_6e
    .packed-switch 0x1
        :pswitch_3c
        :pswitch_2b
        :pswitch_24
        :pswitch_11
        :pswitch_3c
    .end packed-switch
.end method

.method public setTint(I)Landroid/support/v4/graphics/drawable/IconCompat;
    .registers 2
    .param p1    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/graphics/drawable/IconCompat;->setTintList(Landroid/content/res/ColorStateList;)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object p1

    return-object p1
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)Landroid/support/v4/graphics/drawable/IconCompat;
    .registers 2

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    return-object p0
.end method

.method public setTintMode(Landroid/graphics/PorterDuff$Mode;)Landroid/support/v4/graphics/drawable/IconCompat;
    .registers 2

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    return-object p0
.end method

.method public toBundle()Landroid/os/Bundle;
    .registers 4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_33

    packed-switch v1, :pswitch_data_6e

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid icon"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_15
    const-string v1, "obj"

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v2, [B

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    goto :goto_3c

    :pswitch_1f
    const-string v1, "obj"

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3c

    :pswitch_29
    const-string v1, "obj"

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto :goto_3c

    :cond_33
    const-string v1, "obj"

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v2, Landroid/os/Parcelable;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :goto_3c
    const-string v1, "type"

    iget v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "int1"

    iget v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "int2"

    iget v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_5c

    const-string v1, "tint_list"

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_5c
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    sget-object v2, Landroid/support/v4/graphics/drawable/IconCompat;->DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

    if-eq v1, v2, :cond_6d

    const-string v1, "tint_mode"

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v2}, Landroid/graphics/PorterDuff$Mode;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6d
    return-object v0

    :pswitch_data_6e
    .packed-switch 0x1
        :pswitch_29
        :pswitch_1f
        :pswitch_15
        :pswitch_1f
        :pswitch_29
    .end packed-switch
.end method

.method public toIcon()Landroid/graphics/drawable/Icon;
    .registers 4
    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x17
    .end annotation

    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_6b

    packed-switch v0, :pswitch_data_70

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unknown type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_10
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_1f

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-static {v0}, Landroid/graphics/drawable/Icon;->createWithAdaptiveBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object v0

    goto :goto_56

    :cond_1f
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/v4/graphics/drawable/IconCompat;->createLegacyIconFromAdaptiveIcon(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/drawable/Icon;->createWithBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object v0

    goto :goto_56

    :pswitch_2d
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/graphics/drawable/Icon;->createWithContentUri(Ljava/lang/String;)Landroid/graphics/drawable/Icon;

    move-result-object v0

    goto :goto_56

    :pswitch_36
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, [B

    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    iget v2, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    invoke-static {v0, v1, v2}, Landroid/graphics/drawable/Icon;->createWithData([BII)Landroid/graphics/drawable/Icon;

    move-result-object v0

    goto :goto_56

    :pswitch_43
    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResPackage()Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    invoke-static {v0, v1}, Landroid/graphics/drawable/Icon;->createWithResource(Ljava/lang/String;I)Landroid/graphics/drawable/Icon;

    move-result-object v0

    goto :goto_56

    :pswitch_4e
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-static {v0}, Landroid/graphics/drawable/Icon;->createWithBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object v0

    :goto_56
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_5f

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Icon;->setTintList(Landroid/content/res/ColorStateList;)Landroid/graphics/drawable/Icon;

    :cond_5f
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    sget-object v2, Landroid/support/v4/graphics/drawable/IconCompat;->DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

    if-eq v1, v2, :cond_6a

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Icon;->setTintMode(Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/drawable/Icon;

    :cond_6a
    return-object v0

    :cond_6b
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/Icon;

    return-object v0

    :pswitch_data_70
    .packed-switch 0x1
        :pswitch_4e
        :pswitch_43
        :pswitch_36
        :pswitch_2d
        :pswitch_10
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    iget v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_c

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_c
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Icon(typ="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    invoke-static {v1}, Landroid/support/v4/graphics/drawable/IconCompat;->typeToString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mType:I

    packed-switch v1, :pswitch_data_b8

    goto :goto_8f

    :pswitch_22
    const-string v1, " uri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_8f

    :pswitch_2d
    const-string v1, " len="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt1:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    if-eqz v1, :cond_8f

    const-string v1, " off="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mInt2:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_8f

    :pswitch_46
    const-string v1, " pkg="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResPackage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "0x%08x"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/IconCompat;->getResId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_8f

    :pswitch_6f
    const-string v1, " size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mObj1:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_8f
    :goto_8f
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_9d

    const-string v1, " tint="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintList:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :cond_9d
    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    sget-object v2, Landroid/support/v4/graphics/drawable/IconCompat;->DEFAULT_TINT_MODE:Landroid/graphics/PorterDuff$Mode;

    if-eq v1, v2, :cond_ad

    const-string v1, " mode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/IconCompat;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :cond_ad
    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_b8
    .packed-switch 0x1
        :pswitch_6f
        :pswitch_46
        :pswitch_2d
        :pswitch_22
        :pswitch_6f
    .end packed-switch
.end method
