Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BF0476694
	for <mfd@lists.linux.dev>; Wed, 19 Aug 2026 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148171; cv=none; b=UT1stHXJSqziTZhcaFxyx/IxDUwZdqACNU8BNAkTAihGTzZIPvh63Yr2wKQVc3YneZX9FYPsqxrMv4IGQHJwa+1dRu9DbIDHcD8hSoFSt12aCQoJ7GBiHCeJvbfs0nGddqFJmCVVrsBJPhhPd/Gushz0bdioYFU6jxW0GPk3RCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148171; c=relaxed/simple;
	bh=dlXJOH7EU0a51dAApmdxSA9IP84RNY0Lan2Iu+swRps=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KDKfy47WBGr0EamtoJAoNbyuy59uxLjMAi9VpvvJMJLucSVzVeQarp8XHIfxTGdmfv3qJC9+EX4Pquudgh8Dy93aTDay8r8UohksW9QAPgiOTzH+BEbEaieMtza8Fyb6H77nuxeY5J8egkJUt6trVAZUggMPb8RHJ1mRcQ2LIA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=exNdrjtD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="exNdrjtD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso12172245e9.1
        for <mfd@lists.linux.dev>; Wed, 19 Aug 2026 07:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787148168; x=1787752968; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6HUNEom2bL9x12H58ozzx5ab5h2GR4Ct4g1sEt5gJ2k=;
        b=exNdrjtDfVqeGZtUl+XxJJp0y05i8IFjSUIxAsutUy4hHhMgD9ixmSPghtj+XTkpLZ
         9c4vgAFrZyNERG2dA9Ek9KxuhiiM7sSNuEQKntIJBgE9cH1xDw2v5GKLBdRWdHUth3NI
         UD9mMuAL7Qwm4KkbA9Rt11S5DgUeQzW9haR3hKhPxtlMMbBzCCwfppId2PlEKBUr01PC
         0d0OmppGt5HEPWyAuXyZ/8ZMWX5eFMW50NYS27Mnqatk1YNNPINSqWBKN57q8DLO0205
         eY6yt6CKmKBJEsP1OPOM0dlbR92i2I64FYFYaCJIUjwF3Bbq0QOnIF69SFCgwCfre2zq
         wLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148168; x=1787752968;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6HUNEom2bL9x12H58ozzx5ab5h2GR4Ct4g1sEt5gJ2k=;
        b=iKfEPAA1j2uOVj/18bjRBd3+3dDbm+51zCYpUWN7eUyFLuFkOPU5POjnmN3f/W6W/B
         2xaxScAlD/tHNevV0d96Y+LFE4pLPa4ZtlgmuH4pzU+5xJBaHcjeSbjo4/ByM3mcdtbJ
         ulCg3XsKd7olOjF4RnspH8y6CHoDrEr1oAKxsZr1OUWAMj/pgvRqy22W20dtYhMTdxEh
         F0hgB67L22CxpEHJphQ6ksfvSMHPxdzUUVHKJFtvqQXpyu3WdkM757ujP3NYerPT5lmX
         G3UpFiVQRUrGP1Al/4VXwLhEGR1o0kQpqydNu67lWATtUDhjJRw0I+QfqtO8dsM2rI3b
         iyOw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1lvmzmc5pmM5tfhYSXr7Ct72IQfRD3DmAAx2RkK7fuFtdDd6zCJWA4taLnExDrqEnS1U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfZxAvYa29qcrXxHA9op7X5esAYeG+QBYRcXphojxU/XLsnaGF
	fwkbokTYhY2rMpoRJKR7ZETSQxk3bbm47TGHBcbr8jSUhVw66cTZkkBs1LbgdPspG8Q=
X-Gm-Gg: AR+sD13HEjWAXUff1IoWYseJRMG0cfoN7bxKm/E4lzsof0ie1Vhu3DAPcO6E2eKICZD
	9U7A+0jcMLz/+AHblid/dNYyziuFlrjobaa25SR/9R1OfiizC+yojBgCiZ4gzGGf8hMzAkKGnmN
	SKG0bsD3kPxncmiNPh8mlv1AKrOvxbpjkMzq7I8wof0IepKpYQTwKcqbai3AWhvgTyutrwE+gy1
	2T4yEaVDYAk8VcZpwY0vkWjqMaIVpWC6T/crpB2aFViMlKXrCjs0gdgALJNtReDSf6vOxskkWnL
	DlkFUxbP8roGq4fMR6kALBXfjLUOhTGYG20fsnH+yge0cADOtkaIdLT2H1vNThcPcD3SXtQ3jld
	cEq31sPm3MgttMhtUr4/JSglaNGMfUHJsO6jvHyLx1NIY7LY+ZJIPyy48X+JCS8Eqisw0+GbIT7
	35tz+/uyMn7jwkXEpS6t4IdqG83DmDHy1Xtg9tzHhb/fxq0WhgG0gZ0AxZO/RQJ1R2RkOKQ1lHt
	Lk+/Sg=
X-Received: by 2002:a05:600c:4eca:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-499aa1a7a53mr77553585e9.7.1787148167637;
        Wed, 19 Aug 2026 07:02:47 -0700 (PDT)
Received: from [10.0.5.39] ([2a01:599:445:d261:4474:9672:b73d:5481])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1111a7sm65896975e9.6.2026.08.19.07.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 6/6] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci
 prop to vuart3 and 4
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, mfd@lists.linux.dev, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
 anirudhsriniv@gmail.com
In-Reply-To: <20260818-aspeed-driver-v6-v6-6-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-6-fd7cc0b338ea@9elements.com>
Date: Wed, 19 Aug 2026 16:02:33 +0200
Message-Id: <178714815309.32179.8598674853319251320.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787148161; l=396;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=dlXJOH7EU0a51dAApmdxSA9IP84RNY0Lan2Iu+swRps=;
 b=c/KerOBtBLlU7G268kqzunbiL/W9hE013JTk3ATgEU/VaHaT/LXB+PpH0Ob3QlfkpPx+mFF/z
 EYquBWAhiQTBMj721ke3wRMepR8gy9yQ4WznJiFfSG2PvjnXP2qnlLi
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

Hi,

On 8/18/26 12:29 PM, Grégoire Layet wrote:
> The VUART 3 and 4 are VUART over PCI.
> Set this flag to indicate this information.
> Also set the scu-syscon phandle.
> 
> Added lines are compliant with dt-style strict mode

nit: no need to add this explanation about dt-style strict mode.

Other than that, changes are fine.

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>
