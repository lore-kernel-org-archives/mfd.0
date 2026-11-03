Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793703678;
	b=cPCOigFipo1DeydU6e8xPoEWRgmyDLC2o59Q/l1JI4p4PSiMYK6InsOukHUgjH2yV0iQ
	 7W4WFOy8IGoHemID4Vpu0Q56bExtRAVlX0x5LUy++dS2G4nHcM85V01JuzZcGAaQ36D0s
	 pi3iF3cbz/JQa741SEgtFaH1zSq9Qr1FrETxja2Fp97AQgWzXJuv6rRdPyUcnxxGTLDxW
	 RpT9lvhPpt3hI5xdFY/96Gf5bArr/Dew6P3/StJDfQ8YPQN0o/6XqDfmvZNfMNCYHDWCZ
	 QZtlFTBil847KYrKhTF2+grSWcWTmPLOUjXIqAuF4QFLLvlw6WmQsaFmof1464i6BeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=sn9Od1d1g96GmgUVpWI8H/bAOkp0jHvgb53RStXQYfQ=;
	b=eMFg9i41kshvq+8zx0N1wlTtjXXMbNwkKzKIZ0Chgy3srl4P7oqKmsoRpbgW+aFAgFPG
	 anxuUhKRgA8pUuqLP9TfSIV3jOdU1q2gpW0n7+FgPQH3/1gGelka/EfSpmdZsTpkcvfcX
	 goMYwxGqUYR8NGzF/7eILhm4qu+ygrit1oxovwjJx7A7OH/5yuNsxe/g1IyxPFEywJIT5
	 YGLut5N0MRXIHtJBMINaojI2XO4wwHOWTSTZn47jbz7giyL++mC+7gFhCqdXNEzgFvIdG
	 g/IFRe2mGAd2ufFIVo5IXMi1IIlLDYNudDxADQq/aEdMxKTfnC4Py5FDYxO0wWcSG/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JVntOTjh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DC3606B108
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 11:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69DC3606B108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JVntOTjh
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5365d26ccbdso56803981cf.0
        for <mfd@lists.linux.dev>; Tue, 03 Nov 2026 03:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793703672; cv=none;
        d=google.com; s=arc-20260327;
        b=A3ZTZx36RR6MyFQPqKiZ3MhvOmze4lmhIUeSE3Xv6vdj4GIv4cne/0GFmBcUb8rMiV
         yjG1CPOMWV5O/0Vw+DXJICwX/OYgnpN/zG2KkCc1rWpmLQvJOCIZDxxDMS4CyZZawSD5
         BpTBCQiWAEvJVu7p26QmCcZ8RP3THeXzwbOghYUY43dYKIym/v9kdP8F6Eoh3aShDkwo
         5+PcyzVMbPzdjr61QqypR11Sq8WUWS2ix8HXp59JoJjkuGG5RpoQ6PzzBAOS9Yy7YDIH
         m7XRJIADKQ3JVnyXOIMnrCXJk2L65D4CH7jH551BTr0KAogNyP5AJk3m1t8D9ZMKtT3f
         8mdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sn9Od1d1g96GmgUVpWI8H/bAOkp0jHvgb53RStXQYfQ=;
        fh=e2Q4pRyvBDT19oNLaQt0JmU7dRdhhpMYy5eP1odgATY=;
        b=jIg+vh70CwW2t0dTR8om5wXOSjcyTH1qn1Lhed6E5hpZ9ODjnQr3ZYzzUvfCmnFN4Q
         tTKpjpDRs1lVD9djgg/0ChVK7shcwGP8VdHaQu+a0cGSfU86q+Lphw5yveRvG2VtiHFy
         LvV/hoCXJ287b3lzHrV/uJU2QMqpUcDVILNf29hZ4gX7FhedQumNWpjRi6nGegHdAC8C
         qKNHsxa/tOqjSSdXG2QgZfIbmdBakfPReweCw7L220Lig1T8j7QKjSW4It3F7biaKMed
         5KBpQ9KbU0be8Wb3iAdyTYhkP6rUPZjmgnjsTIVH3e/h/rqA4FqhsarGOJ9ZXnDXerFq
         jm7g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793703672; x=1794308472; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sn9Od1d1g96GmgUVpWI8H/bAOkp0jHvgb53RStXQYfQ=;
        b=JVntOTjhdd7xobKoZOrnnyt6hngP7a/CRQSutRLL6rz03v3Prtj1YbM7J0ib3OKWfp
         MG10OOW/dr636T3xUlgcUPuVVhOdqj4BH86pJaSrCsBMpDDh+7UzfzPh8oQEf6rBL9MI
         8x9DGWjoKjUgfmATmnFbtbiS4clpjYL66R0DY5Y8ygYsP6hdvfcw1sDdtBhlJXjn3n3L
         WCreYd9NQ5Ig0BbSXwAWdE3l2miwj4Cqp28y7dwHALnZBrio+8UCH8/9UXdjK1LDu6PQ
         pd8eQ1aSi18as8D1FWp46BOC8zboRHcSReH2y1zY4GbHKAEgDlZJeUYQEtUG2fCgiugy
         OHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703672; x=1794308472;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sn9Od1d1g96GmgUVpWI8H/bAOkp0jHvgb53RStXQYfQ=;
        b=FAcya6eMWwSGV/S/e6FpZpK6GIOT8DdgPP/ZP1sv+p3dicLAcrDZ93cO6lTsT+WG97
         0F74xS+qVKFEd/cNuejWEN3QWOHn7x1of5QgHqoetC5cN1E9cBwr1EeLV/tBeJ1Fp17e
         Yv/9JIA5fWaF3iCJIj6v2NK9ikrqnbQwxEIWcGAOBEEI8jsqutxlPbK7EMu4PARWpojA
         L1RjfKfNv/9i4T3Z+pWKy007aHjvN0iIgeCdgHbxhITeHuJwnXWFNuwft8smHH1zZ/Tj
         ohO+QNVjLM7oO+M3e8NfuX5aflad567+5ty59hZpVPtC98ruLCYbEvHKqu0hlWob/SVy
         9q9w==
X-Forwarded-Encrypted: i=1; AKwUvBzOYvkox96hLN9R8e3UrkoizBZjiS1MRXRD+VMTUAo5tpD/cZIOKGrcilTYJfvMKvuhdnA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Olcy5Drhgby9g0qjARm2Bt9dxkvxO33hFgivI+Tu9/vDUfIrA
	T22Q8zr5DDb6MUp82JpZ2cRucC3I/I8JPwA1jbwH5niEEXsIpsBhPslfefTKCPeD88OoqoktW+u
	LRLxp7+XxBggGRMQn6kusrMkEtYqH+/ut6Ye26naGTQ==
X-Gm-Gg: AYBFou1llkQB22NlgwFjNiC47gZzwQfNG63/gWmOeNGiM31xDDiO1x8klgr3al/TvOK
	447wHjBM2OHpBg7nwKpQInkTqmlJe+r/F8s4oZsAqdrxo2SkE287r2L/o/ZXVrfDtFxLm6i7hec
	HQhNYQGIXf1mAnc3Kp5UZC8MQmk4Ufz7n/Fgf9hKWM8/zG8vUDyTQNSWsE4tvftiunvnOB+IzZA
	xhvrd/tyeADqeh/mZnG5kNhahJ58RaZynRXjXuyBjqhKThKQmgAkRm5hQElGq19rEi9qJcQ5Ldp
	JYQnzlWAzfn/b4OYOENmWWX2DO99PgJtvbVmNXgaUdyOSzkCvhh2mCCM3zy+0mlULbpJr52nFn9
	8P6iWTSIpVua2jriZQWkuyV7Vyesm3tUqwHh5N+J3CSRw8eCGBvjV03XdsrZMb4CNTtOYLk0=
X-Received: by 2002:a05:622a:1386:b0:537:f05d:6ae9 with SMTP id
 d75a77b69052e-542b62a5744mr204134421cf.13.1793703672263; Tue, 03 Nov 2026
 03:01:12 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102-acpi-mfd-v1-1-d61029971be8@thegoodpenguin.co.uk> <aum3RLDLDa1gllge@ashevche-desk.local>
In-Reply-To: <aum3RLDLDa1gllge@ashevche-desk.local>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 3 Nov 2026 11:01:01 +0000
X-Gm-Features: AclHuK-r_cJD1goYWPornsINa7shzhekDP8lLl1_99QVlK0QEb0lwrUHquiGssM
Message-ID: <CAA6zWZKqCpD8GLjnTwAOnBq+Uhq0fA=eCRm4tkX9YDeiC=h2mQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: Use named initializers for acpi_device_id
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Zha Qipeng <qipeng.zha@intel.com>, 
	Qunqin Zhao <zhaoqunqin@loongson.cn>, Thomas Richard <thomas.richard@bootlin.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can you split Intel LPSS to a separate patch? It will help reviewing both parts.

Sure I can - will do in v2.
