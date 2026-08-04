Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5E941E6A7
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 19:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785872083; cv=none; b=lFr1Lt8lc60CbbFdVLQxE3IvgB+9ZGMMeLufGp3mtXmG38hDEs1/ttu78CEzfcsN7csHUybKTUk5nObdOO76Xt/6dMxRYDL34hw3qFHYqjfw0BslhHlUhmPvMqoAwdT9AORnPV9nqSBnii3jhXyVdqQRzVjiAcPcI/arX23ZrZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785872083; c=relaxed/simple;
	bh=FkX/xieosdVcbH6HYR/PC2y2qnBz+V3S46vzsZqxsNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcNmvLGshnh/fRtq4Duk1nJligrydUtoMc2+sBYaOi/EyQH23HRL9Cp5Vi5lij4sjC7SqJ9aJwOnI28EvSWVsQBkBl3+e+z6boVB47gDmFA/oP88RUhxFcVZYY9n/30CvIEUqyO458ZFDl9bsuL9ubNVKBF3cN70qH3xTXiZP0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=Bt370UoU; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="Bt370UoU"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4a071495be0so158609b6e.0
        for <mfd@lists.linux.dev>; Tue, 04 Aug 2026 12:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1785872080; x=1786476880; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wvj3oWgLlHevgQNE90cRfYih3W8rje/GVXDKMGEKiAw=;
        b=Bt370UoUbfnZG7vE5DI+BveIaDnJtISCQmQRBMmOvli/FY3S1BxyN5xwIb8aERbmsx
         XRlytD9da4V5pbhl4Yxi++GmYzWLqv6AUgCI+ZxC3mcM+V+yVZ9aVkdOjcgrRtloCyy6
         2cPNOAxM7c6TrtH+Rysg2M3EW6KwMLtY1Nfevu5RQvu9gvE+aBwSg+Hg7yAXjO+J4jQb
         y9YfC6ousZRiNP6a4MQyta13ADAR5iPHkJgOzNgX4KBft36rWYbhdrBQlbkpVm9PNSU1
         t9xeB/Lmc9kXWoa+mzTx/mzvWWC2R/g3Ce7YX2dNBpV/8H45ed3i0FyTzdKAj9/9BWQg
         EYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872080; x=1786476880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wvj3oWgLlHevgQNE90cRfYih3W8rje/GVXDKMGEKiAw=;
        b=JxChrI3cNG/3SPMxyG27/tapToxbL8lF8h6YfdPl2RBNE7qsl3mTAIZLYgIjNTGz46
         itfoXVUvGK1F13F++GsvkzVkt0FKrZs0lRrX6q4uBzPM/snblJqniJSGVAvPt0JmwdeR
         alj1lcIHZ1cwpBavvlR5fPCfoAxcttQqIBrjhP7h/7oIuGrIzzuT5+sChcBTRrbWzmqQ
         Omnot5uvNmS9D6+qwm82bv2KhZM6Fg5yFPlQEAiNz8TiJQo9KGwsKau6FF0TDLG11Zxh
         +hBiKdk/uvmNmNRpiikkcwOV8JnBqSQ858v8dvOEA5BmjGPDU/9zpwXTpzCuBcCT0jWE
         v24g==
X-Forwarded-Encrypted: i=1; AHgh+RpOmnUuLnE3bIMHG+WBbh2bmiVWdoLUllhcPtgry/ciH3JBJ549v3jPo30NIwj/oPDbcAo=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywbe83YqJ3WIiabxwUVVtE95m49/eykX62zcp8b792jphd4voj5
	bN6coBEeH6aKsmgm41gtgiwg7xLYiXIvKt+lf57zdWxNmTe78t5RpynSIdCFhVjTToE=
X-Gm-Gg: AR+sD13zZmEcoKspHeOnEPTbfWU2TMgOmYbxDQmPqg/SZNHKixjIeNSX6OkC7Viq32V
	iDKlHnPX+TQl6ihbwBZO2Pg+Nvzcg4/6ZGgvqQ/DNK0WAXJm6CELY7QuJvwhjqWbJy7CditLjHJ
	ldXJktZAt4SPPoE4oKR8nX1dIjDPvAhjfO5DdQIIwspr5RZzqWa8YtXs/QMLXj4HNdHBadY2rpV
	ajAaWc6W5pm1TGte39KTuhzzMT5nFOQ6D4CPvzVwkaQ1pXfQCRz+dWY2vwXWmdi91n7aH30WN2k
	9SeLFGPg0afTlygMYkDkOxkm2YBKFsBnyfPjW+hAYGkbP9/xvNc66lbkkavvVMg72ZQgK4UIPCW
	lAOt6oZLiT/lgxGF/GR8SWhQLegFNHlhftXekZg2Ut7Ekv0cMF6hVV0R08yttALmh1RJtmlvXbK
	ent1uO7TLPVVoRyyNB/gvCLvZN867sHRmDtAUFocpfu9MANvcngU4+sa3HQ5PgGuEMgV6LfltjP
	KaBUrZy5RYDblTMjOK7n9mH+56wVSsdtSHMVcEEB6SNouFj6XVCi0oieyqMrs2gt4Kb1KowAX6k
	2Y2n/BmZsLaRvvpdotem
X-Received: by 2002:a05:6808:1992:b0:48b:1e49:24a8 with SMTP id 5614622812f47-4afae069101mr645898b6e.11.1785872080464;
        Tue, 04 Aug 2026 12:34:40 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:398b:b195:5c26:85bd])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae4b828dsm263189b6e.6.2026.08.04.12.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:34:39 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:34:34 -0500
From: Corey Minyard <corey@minyard.net>
To: shankerwangmiao@gmail.com
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net
Subject: Re: [PATCH RFC v6 5/7] ipmi: ls2k: adjust dependency to its mfd
 driver
Message-ID: <anI-yljxhMbZ2DFt@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
 <20260805-ls2kbmc-mod-v6-5-16ccde412d86@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-ls2kbmc-mod-v6-5-16ccde412d86@gmail.com>

On Wed, Aug 05, 2026 at 03:14:23AM +0800, Miao Wang via B4 Relay wrote:
> From: Miao Wang <shankerwangmiao@gmail.com>
> 
> There is functional dependency between the IPMI driver and its mfd
> driver. Previously, the dependency was set to "select" from
> IPMI_LS2K to MFD_LS2K_BMC_CORE. However, the ipmi driver is actually
> compiled as a part of the ipmi_si module, and IPMI_LS2K is a bool
> option. Therefore, the dependency "select" will force the mfd driver
> to be compiled built-in when the ipmi driver is built as a module. This
> is not desirable. This patch fixes this by declaring a conditional
> dependency from IPMI_SI to MFD_LS2K_BMC_CORE if IPMI_LS2K is selected.
> This will allow the mfd driver to be compiled as a module if the ipmi
> driver is built as a module. The adjustment to Kconfig for the mfd
> driver will be introduced in the later patch in this series.

Looks good to me.

Acked-by: Corey Minyard <cminyard@mvista.com>

> 
> Fixes: d46651d4e3c0 ("ipmi: Add Loongson-2K BMC support")
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
> ---
>  drivers/char/ipmi/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 669f7600019747bcd2b37563477cf336f19a0407..07f3308c71616215871a730b87f1991d2b502e63 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -62,6 +62,7 @@ config IPMI_DEVICE_INTERFACE
>  config IPMI_SI
>  	tristate 'IPMI System Interface handler'
>  	select IPMI_PLAT_DATA
> +	select MFD_LS2K_BMC_CORE if IPMI_LS2K
>  	help
>  	  Provides a driver for System Interfaces (KCS, SMIC, BT).
>  	  Currently, only KCS and SMIC are supported.  If
> @@ -87,7 +88,6 @@ config IPMI_IPMB
>  config IPMI_LS2K
>  	bool 'Loongson-2K IPMI interface'
>  	depends on LOONGARCH
> -	select MFD_LS2K_BMC_CORE
>  	help
>  	  Provides a driver for Loongson-2K IPMI interfaces.
>  
> 
> -- 
> 2.49.0
> 
> 
