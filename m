Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD1338B157
	for <mfd@lists.linux.dev>; Thu,  6 Aug 2026 01:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979721; cv=pass; b=NIISu+3PKlrpGrRB6z4rTVDiPwa2RAlHvYSVfGv/entst/tqK0i8DAu8/TAgAdqKPwR4QI1imLaGd262cqXboYg+5rPqmwTwD35vs1fJAV2Z3BjYo5Xcaos1c9VHnQaEKJN5yjlPE9nVrmYB0GGpA+zk3thdVNNaDsmum8+gs5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979721; c=relaxed/simple;
	bh=yo8evkMojxMVckjP1gDBAO39OsFlfMPJ9XhfjhA5mDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLrGf1LVJ8iJ+i+zrPJ26RO0g5CT/N0TDiZLoF+VNnBrCqWl0IHSqH8UoONz9Tu9Jw/Jh7vHM/NAERkr0YdVm8YlRah8UcXIVsljnGZPzxCpRibAsiiOWbBzVbDRePAVDgW3cAOnXWmbnvrQqO8o9U3x1EREbAA7RIUyAP98EHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5HWDnrU; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5HWDnrU"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-979dc8b391eso329808241.1
        for <mfd@lists.linux.dev>; Wed, 05 Aug 2026 18:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785979719; cv=none;
        d=google.com; s=arc-20260327;
        b=iokhgtEKLKc2TQxfyUGWrfUbaqsg/0mWAhK6+r+hPpkc8vM6wSXQQwmIl/yW0YF/t5
         Fx7X34XWMKqJLKTxhWOOJ40z9x+cL1/IKfT9H3SbM6aR7lfrDCQ28XIOHUipmT4KVltT
         jbNPQrdXnW854ptpFcrZ6R8zKCognyyTDwv+KcmndiKIziViiw4FQfTxNNGR4YvIGnpb
         Ao9wbiHr1ab4zptz107M++e+F57iNaftKrl/0oBw9HzkrERg/cNvjGe5S1ewwqdSK7WA
         ND6nTsgYL12m73Ow663OZfPFvpOMJQKMe8bX0QoSVwVxLGXd0g7GHlClZr9TuQE5O36M
         L7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=edLN34k9foZMVhZcUUtF6FHiGZ8AVNOJWI7MIXQI8QA=;
        fh=hHWqzuC8RBCMn9qKpN6uTgUTLkGWxrnIafnvPnPSvKQ=;
        b=AyMfrsgNEOjz6IQYTqCio3X4DKybmWNcECN8lXox/xkkjnk4RFuhKwI7sMvYEtc8ZB
         yQEELi3sfmQbuIw9q/AX/vciuDEecJu0VqagW4tUX+UT0Sx6yvzKzECNsmJsQzqrif+s
         gMDaP+dFyTJbPcW+djCpAdwTIsUorDxyO+NHAwEa72uqtNlYU7lrmEUKz52fK1QG+D6d
         ivSCu0lfLSlDmzxj3pW/mLvXticthq/LP7zE3egQp8hki27mvm952Z20NP1rylG9HBqa
         u+UkAqizlddhIqBWp9N4M7OV/ZKUres9LwHBG9uOU7Ieu2IUPKKADadzBw5A66aYPDv2
         l9VA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785979719; x=1786584519; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=edLN34k9foZMVhZcUUtF6FHiGZ8AVNOJWI7MIXQI8QA=;
        b=A5HWDnrUYMXN8mqKXi5Y0AFzwAoZVVHqqkxT32BJK3SUUHBhwEGHIF10o0WZIpApfL
         VN06rL+s7nVpnDhEP9coxmgFbcb97wGxmnVnuNdqIbvXZnzqAJhNMEkt3qhq1kq1NRF6
         1Pzwso31rKKoA61zfUk8I4ZkxvehgSYlaRi6UkL93WIjYeEWmbTpss6QIqzMQraJvlcJ
         GZjacKpbiPh7SlL6eeGISehLZLKFB1xUVXDz5MfQLXW46FlpOowEsGOd/QM8lQ+FQyzl
         d8V68uTG/yGVphxr57TE/youHL9cTR6htzrJAFKhOHmG+yeTi+nSAq9EPoeb4JlXaP5W
         jOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785979719; x=1786584519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edLN34k9foZMVhZcUUtF6FHiGZ8AVNOJWI7MIXQI8QA=;
        b=EuUsvBllYMXYCSN0UTplWMueHJLEHH096Tjy2/mX58haFzixfMNOissvlr2nNGxx2k
         1rjO71pO1udv2Q7WGI7PuY4C+vIzAQeqflteuEVfIcLhOURFBILqtt1K1DyphW5LcAUe
         LVni57NIj5QjDY5qNlo1swzBAknd9VuBW40dBY86hyOpL2zlT32RRh10TQ1zSJWBMy5k
         dmZ2pkr/3i4/AEMQjfrpebuN4gD0NT2yU2uEuz1Q+ZPwIsdcnY4mUGtvveygPEOMCAlQ
         hspRKL0SnMWqNA7Di35BHTgWES5mbwU2e7ANzRqahP0sTjFiO57oqQTYf2kwpf4i5pfq
         zQ1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqqREjDd1xQ+ku8hUelHxm4CFJ/QYGLmkphiqpl9M3LSa3QboXU8TOmePUIjYGM1WCCDSc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGsJdiTpT0fuJ9KJbZohw35PbIq5LFJHCZHI9scPiuV0o4TN2J
	snu6MFhD300vHlsE6Ly1NV4zTlmSzcPsqYVHxVU1vVahKf1Ix2VSlzE6Sgwp0ZTvlibqhkzV04y
	LMPG/Bos4Kp6dSQJ3PESU8+BactB7Spk=
X-Gm-Gg: AR+sD11V2FCOeSpEkXChlUb4YKMGAemtAfdBwLTBU1mOGdWSUtGQY3Et9ydHm7QaHZh
	U+bAqIe66rtlasjneNZYqshNjBnQhJLbKebltpx8o1uwrhIQtRRpP37cAVcC1SLbWOi1ZjqjRAA
	T22nm8oBzAOzPHcmmLYwCYGGsLzbJla83mFihZOJhJ7X8U7TB8S5NcZKIAy8IscL5mp2pWANcOZ
	h2OHQC83hgPVut4WTKcm1BUmh7Ji6PRv0OCZiNQkZffBJ/4joQA4cEjEQZiqSGbcbXof+UQKfTG
	axEsugzf20Bmz1hG0rle5NHBUZ/yCsD8IJ1zkd3eyw8by4IJp8O+LAWK9kblbReueHrWoP6A1PF
	ujCK2kRZV/oPHRXjqn0RB4DZ4bR9oDg4Re7lkTX7AZOwXR/9FfLAJxW5rwL5pHNihwVRCpx6IhR
	Otj72ssDynlajexkEAkG6fzBSsmeHQzt7AirsVqYq1MH8B/Bc=
X-Received: by 2002:a05:6102:5689:b0:739:4fa1:50aa with SMTP id
 ada2fe7eead31-760e8f3596emr3241387137.14.1785979718818; Wed, 05 Aug 2026
 18:28:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-8-3eef49ff1d8c@gmail.com> <30bab755-3356-4d4a-a939-8488aa487874@lunn.ch>
In-Reply-To: <30bab755-3356-4d4a-a939-8488aa487874@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 5 Aug 2026 19:28:27 -0600
X-Gm-Features: AUfX_mwRHCzyF7gAfwi_ObKJnDFQfjNsCJSXem_hxMypqW9gycQbdES8PR3dd9k
Message-ID: <CADvTj4r5y7ME1jb1OxnvjXoQRhpnQq1L=QgdUE7ESNgS2jzTBA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 8/8] net: phy: add X-Powers AC200/AC300 EPHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 6:38=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +static int acx00_ephy_disable_eee(struct phy_device *phydev)
> > +{
> > +     int ret;
> > +
> > +     ret =3D phy_modify_paged(phydev, ACX00_PAGE_1,
> > +                            ACX00_PAGE1_INTELLIGENT_EEE_CONTROL_REG,
> > +                            ACX00_PAGE1_INTELLIGENT_EEE_ENABLE, 0);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return phy_clear_bits_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV,
> > +                               MDIO_EEE_100TX);
> > +}
>
>
> > +
> > +     /* Set the hardware default before phylib reads its EEE advertise=
ment. */
> > +     ret =3D acx00_ephy_disable_eee(phydev);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret,
> > +                                  "failed to disable EEE\n");
>
> If the PHY is capable of doing MAC based EEE, that should be the
> default.

AFAIU it's only capable of PHY based EEE

> Why clear MDIO_AN_EEE_ADV? This does not stop the user from
> re-enabling EEE for this link mode. phy_disable_eee_mode().

I think I was doing this since I was trying to align the driver defaults
with the vendor driver defaults which disable EEE entirely.

>
>         Andrew
