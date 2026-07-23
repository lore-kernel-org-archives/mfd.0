Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AEA45DF63
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 13:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812629; cv=none; b=oUd++2H249C7JRl83kr9vGfQFuXwe2PjD6NS9MEi2TS6UCn03JlaUI4D3XyeqWva9lWonlmUxxIOnnbZnDVeRW2AuehR4Hx0Mulwz+5sL33/z+hKwy8npB2EEKLPtaO21AjkD46TrsOUAev62btQvJGAWohclvi2viP3/3EZS74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812629; c=relaxed/simple;
	bh=u/5B45F28L7HbbX8dI8rZAE5MTELpvNwXDaBpJBMJo4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qN+2X4Fxewmr/JFp+OPJpXI2dfE9ycXeA1UqWvx4f3n8ZkUsClZh44L3agEiTX9g/scz2vQOAiqgvEyTJ9fw1Qm7aWsKQhhZs/yYkpT8ET+qQpqOAy01OjadcAQkyfVStgLgOiR3dVYAuQon8dd3RsuoR3zlXtfUK5Iqw0kyyGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGdfdKc9; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGdfdKc9"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-384caf7b168so95753a91.1
        for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 06:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784812619; x=1785417419; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u/5B45F28L7HbbX8dI8rZAE5MTELpvNwXDaBpJBMJo4=;
        b=qGdfdKc9UO2mDBqGdoP2vdmnHlpGLAx1brD9dPv8i8nBxJYfMHdTUVjAot3t1ejOGo
         7Ll3T/iUhF7LAaUDVU3oaplfdcRLIOVQSk1U4acJrFzAlMtx0yrYF27gUrDAwfFVkC2Q
         N7a2d6OQVjpYR1JOh1OdHFDIfxa6itX2VK48Nf1fcqJL2Wh6u7fjgup95oRkDxnBN83X
         uCXseXrtjPoEKcgA+6HD1ExiyywEibeVkP0MgC9hBapBIJitkRr7vT48imlLVg7RoBBL
         l/d4GN0/PujRMg5+r/vnveTVf4GWqsQ9Gs8nF3USzeZVkM468nGDUgctjj/B0Ze2DPaX
         7gYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784812619; x=1785417419;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/5B45F28L7HbbX8dI8rZAE5MTELpvNwXDaBpJBMJo4=;
        b=dhuJNEB7iPMS2w35y8kqflGdPeaa1FynwRgznHMj7cg8Zon3K77p/Xge3x5jr3zhiR
         0/xGoZHF1UOzd8PUxAoFJh2NDD3IOHHyytJbLKIk1EWMZuG8DajnBEuh4LbG4GLUz75I
         VdkLthmsPN0ZlW1yP9BpUqVRizS+vdxOFuWQSHCPFJYT9AOVq3TQxc0YO5lPEvqMqpBa
         SIXKtrq50cCKXucpvip9EYCYiSfUSg0/cUHppJb/+LVdht2mfSPNm6ZFdQRQVgFAAXdf
         17LFsMc5q8U/NII2luCw8VXEX+pn5IKkgz4Jpmq2OfMzesTdsl6kEHWO9evmQMLeVv/4
         6mvQ==
X-Gm-Message-State: AOJu0YzKnEl1t7hfovoO56TFuJdugsjk7JWx4MS0BQ6jKZmxerx5swNz
	xdgNzajcRMvwQXp9B4YqMJzE4uQPCSD1y5AJBRMMDzYR59zjKKFfFXPzOWj7+1bl
X-Gm-Gg: AR+sD12bpGyjjU/urleBJtT96Lt5Bj21GI1T7/v6OPmkiKpTO0eSLS6AY44tmZ4v0uj
	UCsIamqvprcjt4NWa7DmugmEmE8ZZ/eByw9zfR1cRE8SeXgJiiK7fmSBvucRho2pSYObJFqZnLS
	LQ6OBgEf46t8SS8hRIR0ct0dxb0YBGHuA8xYHrPfPUs6wX4ZC8sGRMJ5/SVr51O89M2cO5o+UaI
	Pcz98ybXwYClYdaWUp0lFE87jJBBAPw8eTkiPZe6dKYfNQEnMP75QgzwRPuvniNYWJcCqCFfMYQ
	5cO/n83Q7Jze1rOb32p1BIdq3ORl1CEtor1ai/Dtk2LCVUavYYOcPTTCTYYofFsvpWBPqioJNyw
	DNM926fZERrCQaDzQ6KTrSX+PmEaTdSZ8P0s3SZkPTW2InfrysIgj8xpruj6/Vfp+z96Whvt8ME
	t3Ir4DYvg5OF1R8bQWs+sb+9jE0DynKC0hEYc=
X-Received: by 2002:a17:90b:3891:b0:381:cef1:11b2 with SMTP id 98e67ed59e1d1-38ec66586c3mr2331471a91.7.1784812618411;
        Thu, 23 Jul 2026 06:16:58 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ebeeesm2622690a12.10.2026.07.23.06.16.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:16:57 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v3 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <20260723131120.GL3363113@google.com>
Date: Thu, 23 Jul 2026 21:16:18 +0800
Cc: mfd@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <73FED0CE-3263-4853-9402-5D0E081EF780@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-7-ef718636e78e@gmail.com>
 <20260709174055.D25E71F00A3A@smtp.kernel.org>
 <20260723112903.GB3363113@google.com>
 <E1909632-6D06-4648-986C-6B7867D231DB@gmail.com>
 <20260723131120.GL3363113@google.com>
To: Lee Jones <lee@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B47=E6=9C=8823=E6=97=A5 21:11=EF=BC=8CLee Jones =
<lee@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Thu, 23 Jul 2026, Miao Wang wrote:
>=20
>> Hi,
>>=20
>>> 2026=E5=B9=B47=E6=9C=8823=E6=97=A5 19:29=EF=BC=8CLee Jones =
<lee@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On Thu, 09 Jul 2026, sashiko-bot@kernel.org wrote:
>>>=20
>>>> Thank you for your contribution! Sashiko AI review found 3 =
potential issue(s) to consider:
>>>>=20
>>>> New issues:
>>>> - [High] Unprotected access to `gpio_chip` without a NULL check =
leads to a potential NULL pointer dereference or use-after-free.
>>>> - [Medium] The ACPI memory resource search for the GPIO controller =
only checks the first memory descriptor, ignoring any subsequent ones.
>>>=20
>>> Looks like there are a few of these to consider.
>>=20
>> Many thanks for your response. I was preparing a v4 to fix the first =
issue
>> found by the bot. However, I believe that the second issue is false =
positive,
>> since the memory descriptors (if more than one) in _CRS are ordered =
and the
>> position is meaningful for the driver. As a result, only checking the =
first
>> descriptor is acceptable.
>>=20
>>>=20
>>> I'm unmarking this for review for now.
>>=20
>> I still want review for other improvement suggestions. Thanks in =
advance.
>=20
> Due to extreme workload, I need a clean or justified Sashiko pass =
first.
>=20
So is there any guides that I can refer to to mark for false positives?

Cheers,

Miao Wang


