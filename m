Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5363B4EA9
	for <mfd@lists.linux.dev>; Fri,  7 Aug 2026 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091838; cv=none; b=EkJ+5/d5GYyg6K+Gei48dxadqqjfmL5NVvQzwpTKlpY97eacqDhJwUcYlpoRfLlQVDGfGlo4bPB2QRh6gDSd3wd7a9WPfoc6fHisf6ZJ3b4Z7JJAaeYqDGxx/z0WEGMG6Lh3zGQx/IHRmAM4as7egBLxaJkdqkhiNX6tsynWdoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091838; c=relaxed/simple;
	bh=P/41CvtTcGae/equIvztsQBGuXVGaJoauUSj4lEXoMo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=QnIlnLYlMGuVj3JHLSpTmwXVsBxm8mioS/VxbnI3tq2hZ9UIdp2DBplOJNl0E33nN5yPX9Kz+iXugikULNnuyDxHLZaG4KFYizP/NmR2cz3NYwJUN2XDZAy0tHuEZ/8tw0Ypq/Twlh01OUWu+ElLoD55/Fn4aQmgZiVZUMqh2vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=QgmEv3gh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="QgmEv3gh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49553515a8bso46194305e9.1
        for <mfd@lists.linux.dev>; Fri, 07 Aug 2026 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786091835; x=1786696635; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jEYndMHB+hzzoGm3/jN5rHUQhOLtVYWufPY6GQuzOfA=;
        b=QgmEv3ghsF4KlS8oMoh1TZgtp6w7+hOU/K9mVhoQE7HBw8F2h+fIqxtI/Voky5EfbK
         hqNCU0ry4j3aQUEy/w7BRuYq6pe+xoB4So8fLJn5h4CrtMEsUM1Vzd6/s5P4b3SQSYzN
         KlCXY4pOugA0T2i5p3kemXBXPqlRqV7KCHLVrAeImb2ZYXTqyx1cf6ANn8gmktTgXQU3
         oMBrd+dmonnA8J5DymU7bwxNokZkyFWckdzgYFoaexlXqfWeL2xUL/3hT8wmd2/lwHSF
         FPwHKHJySiYrmixlPs4lzuNC3f0aFxC6+ZUYjaqfJb6IwlQNLTuAePWH/rH+4Ik68Jj3
         Cgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091835; x=1786696635;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEYndMHB+hzzoGm3/jN5rHUQhOLtVYWufPY6GQuzOfA=;
        b=cJf1HYZGMEASfFY6yhyw38kw1AThXEy4ogpaBX2+C9q7LXxFoYqj+qtzGaFCUZm1t2
         GVw4TNaJbliGT9kkm4BO/k+2KVvOYxuyNOLpUr20WayObUk9VqsuE9uWHbz3BqBKXDx8
         bH5F82lnX6itGfNX4tUQcro1rCTo9AV/SOR9yHWD1N6UwaWXZgFKkuwFdSQlDsTup461
         AZCizdawEwNn5ntgDjL97QnLudr+giGnewRPhOT/f6y0Z41x6LA1fH4f77hQaEA4PQGf
         0am2Epf3pQPEaqFHHRpJfyGvOmFA1Qs1v5ZF43cQFdWxHaZGrQhle6A9m+YYTLmRQcCA
         nVvA==
X-Forwarded-Encrypted: i=1; AHgh+RqU0KRGbI060gU4HG8R6D+PO7ammkEuV0xDGQVwFLWbpO/Khxt96AxamHFyZEgy5SPCwxg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6/6ismdtqCSGkYbNsM2T4PKRRVNLYucCpKheyvVv91eYqM2lz
	HELUXe/XgPhJVM++OnlgBnoXfynAU2fDOvLO4NiOmTF2DcmfkASoxT5G4TPj9RZE6U0=
X-Gm-Gg: AR+sD13D8TklbHHnibbUUAtSq2CP+8hhaAYJhibaixyChTqfb88B2MPeBcFIiDAeoqQ
	Did7NWLbPcib3gj2Nify+LTIPcwWBM9hX0bC2A0gXW70Kkc7vEejmrNEy6GyAfPBK56LBKyELtW
	OdQ5yNgWCmwB9MdI3rz1CIagtqnQt+PLhu3BrxA2Vw3yZ+RVZCbkAV2a0h/RKpcX62ttoYfv9g5
	tORF7sV+NEzoctl45+g0qewJty+TdrpMwyE5G5bxDrRzbiza7Px5ym/vPNhkKdXaQiQbbuPaPHr
	kAlpIzOtZ2RX6LjMIkq0NdM7HKxKvJiYhZywfrSpKlTJgX5QlASwA0n/dgiKdbHvmtuPAYq/vFT
	+8jwFyGwdG7zR1bFRG+N6xCWr6zKoauMrFHDGahFPXR5YfEj+RKvj2ZT6WV/KmkbP3I3nfsI4IP
	+/wpdZKoiudHe5AjEz6542K4ZpFmbtO7ekC0ECdOpWVq3BG140wwiH7t4GYpnuqTRr0JpwPKU=
X-Received: by 2002:a05:600c:a47:b0:499:484a:7644 with SMTP id 5b1f17b1804b1-49959e2eb00mr92663195e9.9.1786091835248;
        Fri, 07 Aug 2026 01:37:15 -0700 (PDT)
Received: from [172.20.10.3] ([2a01:599:843:2744:7f5d:3df0:76c1:3705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7171sm17795195e9.1.2026.08.07.01.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 3/6] serial: 8250_aspeed_vuart: add VUART over PCI
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
In-Reply-To: <84efc6b23b79e901245e9ed7f58546bef6089530.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <84efc6b23b79e901245e9ed7f58546bef6089530.1785932211.git.gregoire.layet@9elements.com>
Date: Fri, 07 Aug 2026 10:37:09 +0200
Message-Id: <178609182923.193353.14922851647951168548.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091831; l=504;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=P/41CvtTcGae/equIvztsQBGuXVGaJoauUSj4lEXoMo=;
 b=w8BqgggHC8+rKIIYkDpF4V+LQxQsLNTjAkqs8Mvxlj5omkapBkoZ7qOK3HWj+EyFPq5fEadKj
 1czd/NMPD8ADtaa6dibTAstN19JKAfgQvZMVKV0WiyJ9NIMbbW8jdIf
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

On Wed, 05 Aug 2026 14:19:50 +0200, Grégoire Layet <gregoire.layet@9elements.com> wrote:
> Enable the VUART over PCI for the AST2600. Activate it only if the
> 'aspeed,vuart-over-pci' property flag is set on an
> 'ast2600-vuart' compatible node.
> 
> The AST2600 has 2 VUART that are usable over PCI. These are already
> defined as the VUART3 and VUART4 in the 'aspeed-g6.dtsi'.
> 
> [...]

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>

-- 
Tan Siewert <tan.siewert@9elements.com>
