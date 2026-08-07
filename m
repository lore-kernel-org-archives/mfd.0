Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB653DB31E
	for <mfd@lists.linux.dev>; Fri,  7 Aug 2026 08:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091844; cv=none; b=ftNW6R9y+SUbd1AVCjIE1o7CxBsCLfbskUbDGk8mGDr9rRnMY56i3HwFZMGaGl0/c13otYBe9zSbSh2mDkys4JdBkeXcO9iOugIf38thSkyfpFggo5so4OFlgjy7CKyetdzOOnL4/Mdr8L/cU9QfZOEwSM5vf9Vlr+ssiSBflas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091844; c=relaxed/simple;
	bh=/UdSyTf9Swt5Ml5qDkK3fqt0U1o1wltMS/fTtppqJ+4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ofIaIiC46D/7Vpvcdc2q/HOEIzvta15Aysohggi8u1MNSVl3reZIHpaXw2FZ/XrwhasT1usY7X14my87C7Jve07XugUQWU2x6w7RPh4SgZUsllbB/4TOvWlk9t9+ZB1iLJc01IvaKJ2ApNYLOzz4y45F/Fadx1aqevxBkqfJvGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=BW7Jt8lH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="BW7Jt8lH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso13507715e9.0
        for <mfd@lists.linux.dev>; Fri, 07 Aug 2026 01:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786091840; x=1786696640; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qa/2IU2RbAAtb2QUYjZKVHQ104XeXVbZBNjUDvADO9U=;
        b=BW7Jt8lHr8CYn9Xfcq75EqrJcm5cegWCNGP1bHrMHK4yM6WfuYRaVULKXOpnDwDORc
         /iyUyignnhonjKuMRajtGebxOSDVS3P9LecKxg8HtXqFESnwMvvEGGuhAodpNhrk62Aa
         5e9UWccfZ9o+xm5ifobaLCIhkDHq+bc1+RGCmyO57dtn9GajwMtv3FjABtWqwdqlA40v
         JZPYj06gvLjslKEVpDln/kWl3sm3dNcFu0eVcenTMq/LouF4l66yQzk0S4VDfi8m1+Cf
         Ie9W7EyuDtlM7loA/CQG4VgFV9ZjvodXth+RHPYsH22XzRj7qEByolsrpB4dJEgccC5M
         oqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091840; x=1786696640;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qa/2IU2RbAAtb2QUYjZKVHQ104XeXVbZBNjUDvADO9U=;
        b=NAdYb97sjGogbQsVJ16gfVhWiz1JxbZqiq6mWwxPSgw/F7vTzZoh8MrF4hJKDHfmYM
         ptXLFqldw1i6SiqyvGpvEXbcJjgE5RaWgFoRxXo0osFa2aGPN2/J1ySJ4yUd7J+LJEHs
         sMr4PvWjLgD2FZXUk4ExQ2e/7QT2LKj/okHuGjnwYr43o7FtZNb88gj55JF8FHhm9Yal
         hppyRBUhrl2CY959YxB0SkbjU0ggcbTnMVP1AiGqGfnrA4L5StuLjtaLnEHj+aX3BInj
         tx+wJIj+BqGoo3Pdir15QvrSmO5uIhY+aKP+AIlu0ft//RY8yGYH+KC5gG05xQNxoEqU
         dk8A==
X-Forwarded-Encrypted: i=1; AHgh+RrUWyxUwcIU8V3DSMWeI+E++HIvjS6SEwmOXee9IW4sGQ1OcBI8GSTZ01Czo6tKdcTuXtw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUfq0E01QP9DwNwkVc3exHoQSAY6WpOPZiPQmFKU48MlQmqfKK
	TR4MpPwauh7d4TP+ntXIMYJdy88Gp6ScIKC5q54rEovAlszpOOuld+RTiVX/PupzpXE=
X-Gm-Gg: AR+sD11lkguQJ45FYmDBg78toRpld/hzKmruUIcNucl+RHBCXVgsDuYZ4fW4y8SdHc+
	XlMi7HoGEdxo4mJ+ng6NAPZc24SaZI4Im7wTXBEI4U88ldZMd7on2hu5bQFfqOYgNISS6CY3reA
	LkmYFInzYVr3lWU6FnSBDsh0vAI/hylHyGnvcIk4/i9ADg0C4hDhzDfOEyz+tAI9Nxw2PYNJWS9
	jSJQIXuRRzBGjtV7VgxWp5kVWOPIFG6+p452vx7fZt09CK4z18FIloCGffOuw1Pah3n4z51NxBx
	T1YuZIAfwBIB2sLZLVPmJMhn7n6myW5aCm/MLNfbDR2UDQ993mTUyj8VH/oUazp0A9Ks8vgc14W
	qpPai7gUG1cG+Iz/opYCsMkYGVT+jahdNfQrkgOltGOIk8qsxZNbHZmG2pS5KsibRmv3C8PZzZ5
	omrVkStYZOHH8KG/TqWF9hk3FzDrnFaeprpF4GOTd66oNI2xMNoN3se2bObLsdtv9QiDP82VugY
	Y9qCzZnRw==
X-Received: by 2002:a05:600c:19c9:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-4995f8083c9mr1877075e9.7.1786091840306;
        Fri, 07 Aug 2026 01:37:20 -0700 (PDT)
Received: from [172.20.10.3] ([2a01:599:843:2744:7f5d:3df0:76c1:3705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7171sm17795195e9.1.2026.08.07.01.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 6/6] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci
 prop to vuart3 and 4
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
 anirudhsriniv@gmail.com, tan.siewert@9elements.com, 
 linux-serial@vger.kernel.org, mfd@lists.linux.dev, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <8d24d424b3504105394055de268e0a11515635a9.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <8d24d424b3504105394055de268e0a11515635a9.1785932211.git.gregoire.layet@9elements.com>
Date: Fri, 07 Aug 2026 10:37:09 +0200
Message-Id: <178609182924.193353.1528505361399129387.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091831; l=2379;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=/UdSyTf9Swt5Ml5qDkK3fqt0U1o1wltMS/fTtppqJ+4=;
 b=Td0FBVHZjwGzgXbgiKllL4oZyf/Dbkogo3BlU9t3xclOt5YoCOrEbt8mL9QHVk7XLfkFRJ7Wa
 6EY3etRH2R9C3Q3YQKlDY8mjaPAEc28k3jIyzjAH3Oq3M2RB4ymHQFB
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

> The VUART 3 and 4 are VUART over PCI.
> Set this flag to indicate this information.
> Also set the syscon phandle.
> 
> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index 7c02633f2bd6..fbd7ab6332a1 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -722,7 +722,9 @@ vuart3: serial@1e787800 {
>  				reg-shift = <2>;
>  				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&syscon ASPEED_CLK_APB2>;
> +				aspeed,scu-syscon = <&syscon>;
>  				no-loopback-test;
> +				aspeed,vuart-over-pci;
>  				status = "disabled";
>  			};

dt-style check fails with:

    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:723: [property-order] property 'interrupts' out of canonical order (should sort before 'reg-shift')
    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:724: [property-order] property 'clocks' out of canonical order (should sort before 'interrupts')
    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:726: [property-order] property 'no-loopback-test' out of canonical order (should sort before 'aspeed,scu-syscon')
    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:728: [required-blank-lines] "status" must be preceded by a blank line

>  
> @@ -742,7 +744,9 @@ vuart4: serial@1e788800 {
>  				reg-shift = <2>;
>  				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&syscon ASPEED_CLK_APB2>;
> +				aspeed,scu-syscon = <&syscon>;
>  				no-loopback-test;
> +				aspeed,vuart-over-pci;
>  				status = "disabled";
>  			};
>  

Same here:

    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:742: [line-length] line exceeds 80 columns (92)
    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:745: [property-order] property 'interrupts' out of canonical order (should sort before 'reg-shift')
    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:746: [property-order] property 'clocks' out of canonical order (should sort before 'interrupts')
    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:748: [property-order] property 'no-loopback-test' out of canonical order (should sort before 'aspeed,scu-syscon')
    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:750: [required-blank-lines] "status" must be preceded by a blank line

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>
