Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793865154;
	b=oCzgOOOicaPD4gxf5+dKvJuYM6I+sSwcPB3Li3dzuSE9Tj/N8VUEmxGzMTBDv9m4kHD7
	 nmqbOn1f9347AOFf3/feyGgrJqmPrNVcbp5Oka4RYqVTCb6sDuKGoo4VDdpg8O1zUHLuG
	 8hgBa93gAXmZheXYCVcM6VIOmLowRS8fNLYkZx1HfCx8G7fdOca7DFKxAuUAzKGtTKnw9
	 0AQUKo2reUz6DiBJgfi8/C8YB6cE8DYNUdb8v+WPwTMcMS6cCSBf4PPQBOpZja83Ag5ZX
	 cD2jVCkfEzXz1kvJcGMTfcZiDc4RyxylZGlBKu6Bh9G0otb1QI5VSy1feL6M4pPnbtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UJ312eBsn1Ygh4FvbElLwVY+HLtQNYmxjBGI04ZaxcU=;
	b=M8ZK/+tJX+iTNWgeAt0oykuMA5ankjQqW/NjYOiisFuN80EOgtf6DlHVbiQHi6uIaUkM
	 InJKtg/u4kyZOw+QILoml75lh+BoyQ4btkOvRlbWqyvdxGJ3zyYV1glq/azAaFSSqyPi/
	 ochwdgKpstjoZdjodrfFP0R/JBOOvDpGET/wICbpHu9U+Oc0dDms2mZ7YWJxlzwPwYodf
	 3cbKBm2k4FLuFr3dYQOlTT5g//Jv8WqCWwY0t3uU6hlNK2G7NC30okzZRzjB+mxk1qCcf
	 DlKD9gwUJve2kVKSLQhf/ZvhAkJoDMt8/R45bgct3k0ha8PTHY8EL3Rs04U/UEQ6MwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=afhhzp5U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED10C606A334
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 07:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED10C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=afhhzp5U
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53fdd2fb171so16524671cf.2
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 23:52:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793865153; cv=none;
        d=google.com; s=arc-20260327;
        b=NJINy2qjHfXhN4K9jk67CL67Py7wLeoXQqfgDn2Nt+POaDT96ewPCtc7RBwhtkO+D1
         zBxYfpsLyr1qGLUG7sI0JjaFjrySz0DzMaYy8s+OqL+U9DrrXukRdpurHzeFT9mTq7ND
         aRjcANFZKK61+J/rKtJ/kXfG76DVPzzP4sJP2tRRDpaHXuey/28OMM2UVJewA7Ako8SD
         G4FSCIyj96LjjE7jV50G5MwDIXMaSIG1DvG+EBaZahprJeFZaSp7ct1WDuDRT7GwrChW
         7fk///G7AKBKlJOfWAJBuEWRATFa62CrwG1N2qJEwvWZiaMkJKNaJBqmzP8k3eeVacO/
         yYFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UJ312eBsn1Ygh4FvbElLwVY+HLtQNYmxjBGI04ZaxcU=;
        fh=/cWNQVb1GCFatEFW5keDFps/BSb3tAwcfb2eHbo7T1A=;
        b=nJ42bSrPV3KgqAd/LpbILhDtdPhoZd43+m51uoqqaRiE13gbEbOu8zbH4bi78/uy8O
         jRZkw0wzLqmW7kKVTdvvSgL6b3Slqx2Q5sOeOjJLAWa5Zp5s+Rn/0ByVQaoC19dab83O
         dyeTV4rDHxNGTfFOBEVmbwTtKzLVpQQmtVikLC2Meo2D9Nc7Nxk0Lxmd5AHFi8LEZViW
         BgsotukzuZAfs+ZJT7/JO5U3yqdwyp+Q4AT+d9YGpE9G1cCGzg0zrpS/K13NWTdyHIGQ
         /VzetNDIiIuDCBKULirKZlsHyh7lu9HzPmwF2xuplD7+JLedEO28fLqpEv2Lc+O2IXV0
         WKzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793865153; x=1794469953; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJ312eBsn1Ygh4FvbElLwVY+HLtQNYmxjBGI04ZaxcU=;
        b=afhhzp5UszcQ4EPd32jIXpiqUDJueGapgGtYXhyjQe4zvp+Ky59O54r9wGfqclEsP9
         JCSSsrqFRzOXzfyaaucyL2ypfe3UtBrPP5xDd8WJvWMh151h7KXzjxebLIyGh/r56Rj0
         DAB+uDjk+LHOsKFCiaX55K5EzuqDvNSKRPWIOlSqy9FN1qX/WvBmAwQCU/oYylPkOmEv
         EStFqvbM805E/JL98XRZR1+JR27N8BIp+I94c4DJV4lTiDE3kDxH7g0LYveSfvemlgjC
         yeWvnCF1jtVNm9RKMK9coqrx7WUJaLwvjvDNDBmD1YYGkgA8HhdWivchV8Lfn645FpNB
         isSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865153; x=1794469953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UJ312eBsn1Ygh4FvbElLwVY+HLtQNYmxjBGI04ZaxcU=;
        b=TBr22Zz3YXSjN7jXdsTNftxXz2uuG8h3QXHv5UkdiVgsZZ1iYxfkoDefxft+Rfb9KV
         ays1UIsJ1Hudw03yQ15xInfIQcQe43jgPfQQ/iO6NPBQ7xWPw4j0Tpor8rOkaTK+c71z
         cDME0xdBod62MzGk9VIbSkglIAudmD3whVXEJWiSmxRXOmfMQddt5VvEczniOCeJUmfS
         goJo/CDhg1qcQ43KfzV2MROiU3NSQejdtXC2URudvwMxNrj4J5xDoHw5RS5/r18j4rcG
         YeQ9KmFaB8yacQ5r1dMe2TXokMmoVyamcW7J2Itb0SK3mnWhicbZfIu5dhreEcuZR52b
         glVA==
X-Forwarded-Encrypted: i=1; AKwUvBw/QbpsLJJbZQr+g35Z1iPpXoXjVdEuVLBQw0ollY6dDmx88I5goEzkIUJd/SBv9ij5gdk=@lists.linux.dev
X-Gm-Message-State: APuU4Z872NA2prl5uAyWwgkqafYGpPHN1B/CT/Eg4lutva1A0zIu9YCl
	RDqB7Gc5FtGuIlxyHXl4fEOSqVxaoUrUfnq/TM7hMiE30IZ3TACkDzAV9pFQ0QgFehKgvf+bZNt
	Fp88rjcWiqPhioLzaUXjw1gL54KqHDJF9MG/xDgNwnw==
X-Gm-Gg: AYBFou1YTbMzxDr8sHkjv2r3YhmGyrKYiDp9d0NXUe9jKFzUAQiEKLp6qlTrtIqlRPx
	6avLMFVe2Dh3+Zl5lK6eW7vRv/xbRFbRaNq1Hu6cmRyru0r2pKmUN7VT0vPnv9OkSXDEDj/oVaE
	9TMZXh+AE56aIXPkzK1S3D+lA+R52eoQJ5H/GH+EOuH3KNGEdnLHKYWVCscwCVaXyyOypMCsTgC
	eM6/M0MMd8TttSNrmNd/wolRkBmSEd7hn/lNmeE0UrujQGO6lFKwkcBAyKperEX2i2bdXi+6Q6w
	7gjWMXbFO8Kh/0PdLjKcLNb7a8DWN4ZzeBveOgv23d4sThMiP4Xh20ECNsj/HrJcuscMh4oyXwj
	BcMqHQmcSGYXGbFsdQUShcdJ78njWQXJ74tNfoRC9WRIZYKjWDThMcoDuf2OqEvM68tJMjCOkJr
	k3Y3oJbNE4YI8fc/cY
X-Received: by 2002:ac8:5e14:0:b0:536:79aa:de06 with SMTP id
 d75a77b69052e-542b781c097mr305348781cf.52.1793865152881; Wed, 04 Nov 2026
 23:52:32 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
 <20261104-acpi-mfd-v2-2-64b9dee3baaf@thegoodpenguin.co.uk> <auulmL-HXdzcdM2V@ashevche-desk.local>
In-Reply-To: <auulmL-HXdzcdM2V@ashevche-desk.local>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 5 Nov 2026 07:52:21 +0000
X-Gm-Features: AclHuK8oxaHoF3EiK88-RObp0nE6JLTdIkoUzrIpdnanDmHfkYi6XSLOF6A9rt8
Message-ID: <CAA6zWZKk9C_PnZKZueYYCT=XHcQA7r4SPM4MK8zWHLyYuxS=Uw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mfd: Use named initializers for acpi_device_id
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Zha Qipeng <qipeng.zha@intel.com>, 
	Qunqin Zhao <zhaoqunqin@loongson.cn>, Thomas Richard <thomas.richard@bootlin.com>, 
	Andy Shevchenko <andy@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-crypto@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"

> Haven't I given the tag for Intel PMIC drivers?
No I do not see it, the only reply on lore and in my inbox from you on
V1 is re splitting the Intel LPSS.
