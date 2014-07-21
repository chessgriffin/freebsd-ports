# $FreeBSD$

PORTNAME=	simple-scan
PORTVERSION=	3.12.1
CATEGORIES=	print
MASTER_SITES=	https://launchpadlibrarian.net/174273717/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	chess@chessgriffin.com
COMMENT=	Simple scanning utility for GTK3

BUILD_DEPENDS=	scanimage:${PORTSDIR}/graphics/sane-backends \
		vala>=0.20.0:${PORTSDIR}/lang/vala

RUN_DEPENDS=	${BUILD_DEPENDS}

#USE_AUTOTOOLS=	aclocal autoconf libtool
USE_AUTOTOOLS=	aclocal autoconf
USE_LIBTOOL=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+="PKG_CONFIG_PATH=${FILESDIR}"
CFLAGS+=	-I${LOCALBASE}/include
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USES=		gmake pkgconfig
USE_GNOME=	glib20 gtk30 pango

GLIB_SCHEMAS=	org.gnome.SimpleScan.gschema.xml

#NO_STAGE=	yes

.include <bsd.port.mk>
