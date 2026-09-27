Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1460A3BB101
	for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 20:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540914; cv=none; b=JC5miVKVaSkYP1/hr/SQg4tk6gut6CEK1LUbZ6c9ZsElKa6fX6D+zQPbb2FUhvwiwsf6yTF08pjZoxkBlfE/le66bfhrmLNCb4TCaT2nFEU3uBpUSsSHO8v2r2rXHJK9gEPj378zB+Sx18+ZxAnbly0JiJhVbG2GKtEWvo6zdkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540914; c=relaxed/simple;
	bh=FSVVe/cPDU2HiWT6f26OgXG1GyfOSzOG3siiaAo3dOY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHU2DT9wlN0KHjKa76zrdRATCeCGQ5/gU0xP3yY0Pj8GHbH9OfO1uuzH5hNiotjvqzh99xwL0l9rJnPKDk69XK49oOnyhErfYw9mPxTc6qM4Y/Iwt96Doyk+vwH8XVHkzlS8KoLhZetVfjUloH90+mA6gdmfPQ4eBT0TiLT2kBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFtWGjmI; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFtWGjmI"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f261so748164f8f.0
        for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540911; x=1791145711; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZpDxu+FSADcYkY7OEJ6DHltLDpB0SvAaV3ZviPXPtHQ=;
        b=TFtWGjmIeTm5bCFx+1CjaWoWSzuzRSovS4oqJfX+Fj1XWACnGWWFljYhnx4FUx6n5q
         LWt0ba4nY+/r2dFuH1Zr4TdSq4EqIXUvCMnijDE06TlybmsuVwT5YjPpXXp5FF7YG0eD
         3qzK/w+4GoYLhOa/7nev45KkOLXqagaHlOO79x0bHNoDtnwi9D4+vvBKSkbjy4d/GRK7
         vSaHTkTCCccuyq/NynTxD6Zp6n+Sn0oNJEQszRdvRoE0j5+aHuGIDnf6TCgQTKqAaD/S
         usnCTVuTNofqUxgrY9oxLn+ksbnI3AdkS8e/dAgB2G815lRcvQ8k86l5JahM/6djFqq3
         hiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540911; x=1791145711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpDxu+FSADcYkY7OEJ6DHltLDpB0SvAaV3ZviPXPtHQ=;
        b=Vm69js0mAytLxX99S/oRIGbXbGJJtx/ZxHgsQzcMEDinzLdKQOWGD4nAFbJqWoyw7/
         QGViX6aIXIKuAhkYYD8Tx9mCV0KVRaEAXybBykYsGY0uuvkzUx+1ayNRQLmeQh+a0fni
         7iyDHjqHNQlcusBZ95Oi+oGFj0wBFNmhaEaebc+Pn6w6got++OJfVDctj0B+kvtZB+B4
         28rTLPTq4dfisRS+lSH6aDmLFGk+MvvH51rS+cIWZJ48fT44mZd0SBXI3zuGO+WMqeVf
         iI4ei8cu/wlu4lD1IndlDiiRXJf1bjbScgbyJDcBqbEl6a8ZmLmNR/PStIztEJJt+aol
         PhUw==
X-Forwarded-Encrypted: i=1; AKwUvBxtXxSM2yzpksHCLYqQU3rRPOpLJxX834k2oepXh3xvr9MJc6AC/YQBeF8DMW881h0dth4=@lists.linux.dev
X-Gm-Message-State: AFuF++lMeOchuPaQ4TyGkNBbqQOo0g9ZfEulf1ftEBmTue9snwj72g0E
	T07qLidMOyRRrqdPoHdsRyCOkNaG8SqYsBJAroBpsUHkej+OT9FnH5lM
X-Gm-Gg: AYBFou0Smnytt3XliPHSZ15cWNfUD8ZdVw6+UgQIGhZHOvVf9FgdPl4uPiBc5FM5IGN
	Cwr3mWKXc+U/13EnOcEhVnpzuum0sEVHWQp2McxX6skwgwnmRzaItCiaLfFLNM44SrO/wE57LxI
	gizTTe/f/bM2L0Az3NSZqYQL5ZwAlqnT0qoUQmgkp9FIwmFgdKmjg7v8YETv4d3dtlPPAhj/zF0
	OtH6UYAyCAPPnwPsZ9vtBlhg/mcb6R9wK89gxZBl/Eh/nQwCXv/MgxhBcUniPdfP6HytL67CdRO
	Eyja2EnIxg86OOwq3v8pi33a4vCY34bT0K8coNn8iVWYc5QZO1r58905PWOyRxAC+BTW6t4ZTsk
	U9Yj0nAoYx/iFaewixeaKfQWoHdH53KRXga6A3cri0rkmJ9pWUa7rlgYa3bGwu64250KNqUes6g
	LPXxIITr36uzgmsgsgJT9mjRmwih+4Nv4CxgTIM9NxXdtsWX/glplPrce/HL/YJt04NGtmyxTuN
	GUro7quWx7Zj1apiMb6ONjmdYUUfEMqh8TiOhhuwpGot+U=
X-Received: by 2002:a05:600c:1f83:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fe66c8087mr198495325e9.3.1790540911202;
        Sun, 27 Sep 2026 13:28:31 -0700 (PDT)
Received: from Ansuel-XPS. (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00571744csm17037495e9.13.2026.09.27.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:28:30 -0700 (PDT)
Message-ID: <6ab97c6e.f5ac67e6.37e70.11e5@mx.google.com>
X-Google-Original-Message-ID: <arl8aT34M7MBL89n@Ansuel-XPS.>
Date: Sun, 27 Sep 2026 22:28:25 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v23 8/9] net: dsa: mt7530: generalize and move
 common function to lib module
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
 <20260925182435.21207-9-ansuelsmth@gmail.com>
 <cd200dee-1bde-4cc2-a296-c93d704cb906@lunn.ch>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd200dee-1bde-4cc2-a296-c93d704cb906@lunn.ch>

On Sun, Sep 27, 2026 at 09:02:09PM +0200, Andrew Lunn wrote:
> On Fri, Sep 25, 2026 at 08:24:30PM +0200, Christian Marangi wrote:
> > In preparation of support of DSA Switch from Airoha, create a mt7530
> > library module and move there all the common function.
> > 
> > Function are generalized to use the reg_field regmap API but still apply
> > the same exact logic. Every function is renamed to mt7530_lib prefix to
> > better identify it.
> > 
> > Minimum modification are needed to the register header and common enum and
> > macro are moved to the mt7530 library header to permit reuse.
> > 
> > A library struct is introduced with everything required for the common
> > functions.
> > 
> > The generalization and the introduction of reg_field regmap API have the
> > side effect of permitting to clean the mirror functions that required
> > special handling for MT7530 and MT7531 based switch that had different
> > registers. This is done by declaring a common MT7530 reg_field and a
> > specific one in the Switch match table.
> > 
> > No behaviour change is expected by this change as it's just a code move and
> > reimplementation.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/dsa/Kconfig       |    4 +
> >  drivers/net/dsa/Makefile      |    1 +
> >  drivers/net/dsa/mt7530-lib.c  | 1128 +++++++++++++++++++++++++++
> >  drivers/net/dsa/mt7530-lib.h  |  391 ++++++++++
> >  drivers/net/dsa/mt7530-mdio.c |    4 +
> >  drivers/net/dsa/mt7530-mmio.c |    4 +
> >  drivers/net/dsa/mt7530.c      | 1368 ++++++++-------------------------
> >  drivers/net/dsa/mt7530.h      |  256 ++----
> 
> The number of mt* file keep going up. Is it time to move it into a
> subdirectory?

The problem as always is that mediatek directory will also contain airoha
stuff...

> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>

I would like to fix some trivial things pointed out by sashiko. Can I apply
those and keep the review tag? For this patch for example it's just the
typo for the multicast MIB.

For the other patch is also very trivial stuff. 

-- 
	Ansuel
