Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EFD3403E8
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772650; cv=pass; b=q5z2NJirStXEVFkqxKP0eLEup7sRckPtDTFiYvCjF/aAxdSwUqSz8d2vFs2/ayFE1BcV0xERfmavzIauaWYdRwGOcXUKqp25uN8968eewxoxHm0rjpEy0PSYVj45pExENaRypREvOkPbxZeB8L3FS9hwo7pQpU7orsskVAnktLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772650; c=relaxed/simple;
	bh=fZ8BuOv3ILCmNDbfVHwiSe/Itiuz/HLNsG0RZrH9AfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ilcOsyNJ6l9UEd6Uiqt5PZfdIGioT54I7qcFSgcnz3cN2snsDqj2x21Nciq1faDbiPVUiq4v0+H4zOw6NRFVr5EPvYAdYU6GTM2VqY9Q0loSqZ+6Mh315DfvStWxgniSwn+KdW65yyRmNmRSrYxnXTCZCCES3cvjFGSZp52+AWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRZa9NK8; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRZa9NK8"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-963f63fe025so694995241.0
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 08:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785772647; cv=none;
        d=google.com; s=arc-20260327;
        b=SwYmqNZ9tK4PBvYxokmnxl2N8mgUEAFsVUxc+ggg8o+MHn1JzOZH4ThsQm3UDRiALL
         5Ros0OVU4+pXg/3cZlzrsZeuQcBN5Bj9yQ7IWZgVoo2cccHbW7j5g3iURn5QWHxBVmeO
         VydVaURn5UOImWD8x6oB5+B3zE5YPXcBMMLNvXlBGvB5FgEGCWHcJBP1eTUP5aTDg+KK
         U4r/aQJCQqv2jVJhaKbeB4QEDWXEtAEJSziyWis6sLrBumy34+1FR0ln24JyyaPJRvkO
         s/h4+UbcGPsFfVALXQYDudyzK4B0ZX9R5MvlTKNaA1qcPbnuzcjHTXXtzKxoVR1W6IL+
         s5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N0JlmS2gNslt5buGhuv7J6Rqxg7nw4cpe34TAqatS1E=;
        fh=ZbIyRf+deN0E7MNPHrj+P+sUwEzPR/Pnlvp7uN8V84A=;
        b=aKd4HgQtqOBZOWheyWfCt1+QC18F+49WCBWxEvKaHYLO4lDlFN8b2XPF+Aj/IXAcBo
         jrePTunn+SO4TNMUVLTr9hH6aixy+fIPRCceeN7HkLNVRJ0pLKkI25/p+u47kKSybD1E
         tbObAn2EgOXZze4RbM+xfRWJ2zRYXB86TWs4glC+S7i1qYb6f1rzgbUJkjYXb3MZJC/h
         ToFV/TARlbZvrG1Qnf/S/RkMYZ0f3wynKcQ+fG1J+FFH3ppuYaDIH6c20enl43lCnIGD
         zrLkkPXqFbEBB9MSKUxLnkahy2c2GgCn9fGm9mgYZSNtwn+IO7jfxpwu13RnanFnnTGV
         8duA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785772647; x=1786377447; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0JlmS2gNslt5buGhuv7J6Rqxg7nw4cpe34TAqatS1E=;
        b=LRZa9NK88DPIqzRGLUUVLKDRl+SU+/Vx0X8dBg0VeNW+86w/VU0Bplw0Zi4TXXcU25
         tDOJQJPf4zVFG0QFneaONBtKMq0Xh1F432WJn0wSbb6QvyOGc5/kW9K2PTcXBXFJOfC5
         oEPcMBq0AgoRI5V2jLTO2n6DTjd0Da0257NXTLG3VlkqdeR+HwJNsAsquOi1pWgzkvNc
         +odel3hY0uPjqcQchHsgaba/DmRIkmUPLZwSTGpOt9tsgrK4zz3qpntaWR1sdDQTt7/w
         3qmexr09jkjmlnuYmRdUNvIE3d4K6MlRWyNzHGy6nhI2imciMhBSc29JDZwtFfxewoI4
         XlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772647; x=1786377447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0JlmS2gNslt5buGhuv7J6Rqxg7nw4cpe34TAqatS1E=;
        b=BzttWXebyp452Ch/7VPDVrt3qkoWPeXqlX8ljTSLui79zEHOTNBehagcKNQ0gQRvHm
         /JAe+5Q/vI23M8t9dyFBcLtRNv1xIgPftOiHDBbNkXNDCifBMriJZjE3bFBoy2gvAKJv
         FEUyi15ISq4m0xpEr6aKAFEEVp1O7lcKF5cLUUgCk9TFXv16WRXUytCW534d9wuAgWYp
         sDYpfW/HxctFSXKvNFHG0Vuwva3LNadcLuCaaxDbvtlUClWCIxYhUGUBxPMFUCy+VGxC
         +mtbOhbLxtz36Q8o9beAPsK6k6CSeQ+dDHRcMbv4xnbomnDxQw+QTwfkygdAQUu+og0C
         7b2w==
X-Forwarded-Encrypted: i=1; AHgh+Rqct/4yHHI4fds7yTxfW7JtKpayETXverOAOqo+FAaqI1+YlyDu+GmHCxt4EB8ExrVkSSY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCS8Ol3dCytVECc3fq2ZrqICAZ3ehXKKnNZY5PGhIBmTKp3jKi
	zXVL0EbAs94RbygREIR48M1ESeo5k73PDohO0/0T2d5aQxu/VlQv42mumbdsRIXFhe3yW+OW3Yk
	Pnt5RD2uXYI/1Bj90hLRFGuPPDrDnzyE=
X-Gm-Gg: AR+sD11xB0+L7C+aWMGZc1sCOpY5eXfNVBMSe+gl1ArxiBaofowTK1R5K4Mj8ipO+Y+
	KnBG0sCKN8/NWOkabzHo8NOXb2IgInDMXt3qqeu3r9BqAmI5I/FcbYOqRhWF1sU3WiYKoFQXsxA
	PGsqCTxJ2NO9+o/5ZzJi452CaRhH8NGsMGBv/3KkIOpM4GQnJIAyj1FCE6t92hD1C50rBuR2e3Z
	kmiPKkOomui5N85OgqpFGdmnd2VAl/E3pDOxeUMXJ3lR1sP1ypAayX2kRxuuwNRwDGNkl/iHm+W
	fIFTDwcum7boe6HymB4mGyaBto8Xe60YpDTezbIOEgPdV3fXUBv63UMA/U1rgQoMazxqt9i9MUO
	6k6XFoE/wPxLT68l/n2RYoJ2CGiAa0VgJhI474Hj3AiyfkS6L89LsAJOCbiMzzYBJnT8XP3/Hzc
	SgvG6cJZcnL1GYaCDyDKvw8jAdotbQQwFxItns
X-Received: by 2002:a05:6102:3ec1:b0:740:177:f357 with SMTP id
 ada2fe7eead31-75b21b5cddamr7901767137.6.1785772647108; Mon, 03 Aug 2026
 08:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com> <aaec8809-8218-4412-a60d-931406dbf287@arm.com>
In-Reply-To: <aaec8809-8218-4412-a60d-931406dbf287@arm.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 09:57:15 -0600
X-Gm-Features: AUfX_myOaFTmy1w_XsU_xICVSFiXSt1enMYBuh0WDNCP9gRZxCQ8cKkbteQKJ94
Message-ID: <CADvTj4qCYjQHOQn1jRTHNNL=xeX6z3Dgc-PLwOBUvX34AU6cuA@mail.gmail.com>
Subject: Re: [PATCH 00/21] net: phy: add X-Powers AC200/AC300 EPHY support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Maxime Ripard <mripard@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:26=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> Hi James,
>
> thanks for sending this to the list, but as Andrew already mentioned:
> this is quite a beast, and would need to be broken down.
> Jernej and I created some patches just for the AC200 PHY on the H6,
> which Jernej recently revived, and IIUC, wanted to send to the list.
> This would probably be a more workable route: start easy, then add
> support for more SoCs (H616 depends on the WIP PWM driver) and more
> variants (AC300) later.

Well, I wanted to validate that the overall driver design is suitable for
the H616 which has to support both PHY variants at runtime effectively
since that is the most complex use case, I also don't have a H6 board
to test with myself at the moment. I think being able to see a more
complete implementation like this is helpful as it can better inform how
we can tie the different control interfaces to the link PHY in a way that
works for the more complex H616 case.

> Which also brings me to some attribution questions: If I understand
> correctly, this has been written mostly by some LLM? I think you would
> need at least to disclose that, if not even add an official tag?

Some patches were, sure, my understanding is that it's not required to
explicitly call that out but I can add more info if that helps, this was
tested/validated using a heavily automated hardware in the loop
testbench setup on an AC200 and AC300 variant H616 board.

> Also I wonder how this relates to the patches floating around for a
> while already: https://github.com/jernejsk/linux-1/commits/ac200-v4.
> This branch is relatively new, but the ac200-v3 branch for instance is
> much older.

Yeah, parts of this are loosely based off of some existing patches that
were floating around like those, although it has diverged quite a bit as
well since this series is designed to handle both phy variants.

I guess I should link to some of the earlier work in the cover letter?

> On 8/3/26 07:14, James Hilliard wrote:
> > The Allwinner H616/H618 secondary EMAC is commonly connected to a Fast
> > Ethernet PHY in an X-Powers AC200 or AC300 companion package.  The two
> > packages expose the same link PHY ID and largely compatible link-side
> > registers, but require different control paths before those registers c=
an
> > be accessed: AC200 is initialized through its I2C MFD, while AC300 uses=
 a
> > non-PHY Clause 22 control endpoint.
> >
> > Some H616-family products were shipped with either package under the sa=
me
> > board identity.  For those systems, this series uses a SID NVMEM field =
to
> > select the control provider at run time.  With CONFIG_OF_DYNAMIC, the l=
ink
> > PHY enables only the selected fail-needs-probe provider, so an AC300 bo=
ard
>
> Just to bring that shallow discussion we had on IRC to the list: I
> wonder if this is the right solution? Alternatively I was wondering if
> just patching the DT in U-Boot would simplify things, and also help
> other DT users like *BSD or U-Boot (proper) itself, to not boil the
> ocean, but just allowing them to follow a standard DT description.

This can be used either way, CONFIG_OF_DYNAMIC isn't a hard
dependency with this design, aside from adding CONFIG_OF_DYNAMIC
support for mdio the dynamic enablement of the correct phy control
drivers is relatively simple with this architecture.
