Received: from mail-oi2-f9.google.com (mail-oi2-f9.google.com [74.125.231.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9A43BB12C
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 02:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789699494; cv=none; b=A8+p71M1BeGwCKUhyOoLd3uJMRR6CorW8si06ohk3K4/1WUp24Hn4ImibuRokTO0O/4C+x6VmlM2fzOxWuQ7klyIktay8z1Z5WDYklU2bSrbUiykaK9uCFT4xORlakyDPebuTq4cpnijEa7b8yMr39o6OKDL+xui7yEuyEi7Dcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789699494; c=relaxed/simple;
	bh=c3NSjqj+y3FWD1owRPrzZW/MDUo1eFOI8gy/KlQbuOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8pTNAiaHe/aUQ4wxe6KTM8xajL1gpGCUwCjFVMd+se9M3YH+LhUHaDrYUXypuXxxhxpxEX2ac1Z0vp+NlUPHDsyXtL4EoM6qRPrtTQ1vw6PudbXqvAgd6aUea2mJjMdXwRE8dAOwNTbXap/C++EBGRc9yzN55VRCK4rQnbYaYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjPDwSw5; arc=none smtp.client-ip=74.125.231.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjPDwSw5"
Received: by mail-oi2-f9.google.com with SMTP id 46e09a7af769-7f4ddb9adf4so86795a34.1
        for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 19:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789699486; x=1790304286; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CiK8mJB4LGiX/oaSEFCC98/XPFlB10IwTwkG8LAJdY=;
        b=JjPDwSw5QnuHSgbwCtOXmZxr7OiihRhp30EE0wKzC9cPaaqUxrIu0LyQ6T8d2vv7S0
         30xT+xWodYbnLqL7iC6i0nfE4h5cLtxyo0SvwK6byrrFxEUHhX02uN2YFGt/HUJ7P1Gi
         0Nuo/5EXeKqCVOTp8oM21qw60DmCNnqlbMPtSq+g3zXipj1HkCI6OMqTbTGl3RyjTFmT
         P8ckuuVjOWy7J4XzBG9PxxIPmzrVeZVbScTLnI3QHU9EbAnzxTUEBQUQ/PFYR7JmtXyO
         KsBoVtm528MGG9TizbNbo1DwkUqcayzdITi5kKLPgZaqaorNhlo4xup2DiRJmtCImZjp
         vHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789699486; x=1790304286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CiK8mJB4LGiX/oaSEFCC98/XPFlB10IwTwkG8LAJdY=;
        b=FmlZMz20TJJliJNN/M5f9rblvVa07F/F5CK9caJyPIPJKotbVX2vosATUeF9LtbxaB
         yTsPJkWb72PscwB4FLIogxA3H9YA7uNWCebQwpgL6mPFwJ9+o9BTECb1/xiAu37BnD9X
         KmpaK2zmmtG/1oto9lyX0TVqW8jvmxG4qAciaqAE3B2Wjd+6v1RhfPQf5EBEEIXTZ+cR
         nUlrdP7rVwC5+B+PwX4Xu5VljS0difLeT/9uF/4c/hL8d6xDCDd9XM0WbhqeF+sG3Xnp
         T7f6YwpNvVg6XyGiVU9CYNIT+aQ4p3JwWKrzPg6oN7QALDakO66g66x3P8ZTI8RwMU2q
         8zIQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9+OhhRSY/DYaJkMgwyFNUjSf3D9SnNjFNHNrtM8utWqLzE0bZ/ZON+SKorfyW1U1Zvmo=@lists.linux.dev
X-Gm-Message-State: AFuF++nWLStNXgAflVmtSsqo/+DRGLYQbGBccPGPHpxbw6nsWvRj/lZr
	qW+Bx/2rI4GhoLQmmKw5W0svcPIKeHMeoVGv0y1BPAX5dQ2fXI4mP/Ci
X-Gm-Gg: AYBFou0E+h0o2KC+Q0sTTSchrS2TXc/eQCQLA7tUtLcexB/nFTUDtuR4LVZKeTIgpdm
	dWbsnjiJmQRPAoGRzvbnlNqwKFThyhRwVqoUnyUqb9v7oLZibRzpMiM4oB7LHIQTzr83pd3r7Zf
	cmbmBenqEfMtXNjZ3zjb6rfBBxpo97I/hd6uzOBg1E8pcf07OvSdVqAVxG4vFfptl0qgMNcQGCr
	d1ljljOWuy6o3f6LE7gx0A+vkc40GI6W1IyzDhheuesM7ClsDLwV3iv13AASvCczq6xy0XG1i7v
	EsVsQxYQ+/J33EQbyHrw09kuYEdsWICuLZgePTiv2MpeOJJQUoRdiWl87OCBLEaPOGRXAWMIWBF
	4BqZe8kFzogPNHWQ1yAaCuEV5v0boh2dlqJHouGWSt1KjzXyhdORZ8T51QhDfOUEmv0gesF2Htp
	UlgrVHEBctboB+mipVlhIhYxFBSnEZrDVUN4WLnxXUnlf/sZlKb9JFJcNmuECJTosfHwv87oe8p
	AECtZPtU9d/qr8=
X-Received: by 2002:a05:6830:640b:b0:7fa:ac4f:79d with SMTP id 46e09a7af769-80de33e3180mr1387349a34.25.1789699486040;
        Thu, 17 Sep 2026 19:44:46 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5128838esm326230a34.9.2026.09.17.19.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 19:44:44 -0700 (PDT)
Message-ID: <3b4dc4b5-4e54-4a8a-b6d5-7177f341dbcc@gmail.com>
Date: Thu, 17 Sep 2026 21:44:43 -0500
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org,
 devicetree@vger.kernel.org, lee@kernel.org
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
 <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-2-db35882a6080@gmail.com>
 <20260918022714.1B1591F00893@smtp.kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260918022714.1B1591F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 9:27 PM, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Does this mix scope-based guard() for locking with goto-based error handling
> in mt6397_auxadc_read_channel()?
>
> While this might not cause a direct functional bug in this exact instance
> since the lock is held across the entire function scope and released
> correctly, it explicitly violates the kernel cleanup subsystem rules in
> include/linux/cleanup.h.
>
> The cleanup guidelines mandate that goto and cleanup helpers should never be
> mixed in the same function to avoid introducing an anti-pattern that creates
> confusing ownership semantics.
>
> [ ... ]
>
Whoops, yeah, I introduced that while fixing the teardown when the setup 
fails part-way. I can fix it in a v3. Depending on the timing of Luca's 
patches, I will probably have to do a v3 anyways. I'll wait for more 
human reviews before spinning up a v3 though. Don't want to spam the 
mailing list :)

Best regards,
Ryan
