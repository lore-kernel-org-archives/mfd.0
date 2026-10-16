Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCE04C9E12
	for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157610; cv=none; b=K4GScqy3+c4Iv+Xa94h0GMQbc3G/neMh2bR2RtFYVp6RsjNZSpz1Hu6T97kMfS1vHENEe4GSXKcEq0P7NQS0zuyqO6fgR3NZc9U8ffwhbQLmsdsRdpbgY4vZtPdqr9UF5yq+ytzGwUzrFydQybBlBmOpmjMLIZ0h9mxEszQA7TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157610; c=relaxed/simple;
	bh=fwU42aIpPNTFK+PFlWvH4U7S5VMKZ3LQacT2xQo+2Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qox26xyOFq15n3VT7OcDAZ64vy4PaPxER2J/pJjUo/ohoET2CEUN4NwQ1tOIuxB3YlSB+H13Mu5oiSfdW0uYAV5w7HyLqhIVilK6X6RR38qWPmcbHRSFsW4Lm581bBmgxi02PHb8cks+DgchlE/1Ycm87UateuuhOz/UdfeINe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZpEVcmW; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZpEVcmW"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-355724d032fso742972eec.3
        for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 06:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792157608; x=1792762408; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5RtP92zEDKwkid1nIgwHk5oXY9tjcIrIDYPD+NtWp4=;
        b=XZpEVcmWH/HQk2uCACi8fMAKuAg2vWvoOS2/rJIJM8AhM9fB7GQ9TWodAxMuFFehzU
         w6cOcjIToROgnOFq2UHP4MsV3c+YFuqbtZVd62rtzSPnSVfYdd3lu4+XVfFi2xcVQTjW
         BvtvgfAlGLel1bnMt9pNxCTO97kGM0Zul7Ivjj9C55qatCgdOPONK2p7D3L8WGlo8yOV
         QFLcma34uKqCQnjNTpo/eStqLpcI3C3k89/LvBjx+5gdUAbNYobmLkZBJLAnEeZ3+ZRv
         uUmEhIiB3PPL44djN/PYOJgXb81sKvyr8KJ7b8xajS3rtbnhhfYa3/2PSIw5QHFR4vWr
         iOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157608; x=1792762408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5RtP92zEDKwkid1nIgwHk5oXY9tjcIrIDYPD+NtWp4=;
        b=GGKqXlZ9s7h+Z66UIqSREOador4XNOLcrbCQdQ+WkGiC1KLrJ2zU4cnGqlc0/bafsG
         iWCKE1cJ6IliRaQ8hmTnDC91QA77po2WC8H8m4gFZ1dW87byEGlNvGB/PRYyHVuQ6pfF
         k9uA9ku0xp4kaDkMVWZ6hzmS6RTbf1qV+MH3O4ImpdOVOf9aEz30PRDRFJFRq3JIQbDH
         qzhnZD9mpZ9vxk8JQQqpiBEn5ZbQQzuXl8t3WtFyjMS3GePQatXx0H0TZvZJLfKLP12K
         kZxeK6+YN0XsqSHPWN3ULLP9jLJpFhP83xI3qLYNOkOrfn5n70DVQlUV6TcAIrRv1kol
         a7wg==
X-Forwarded-Encrypted: i=1; AKwUvBx5IdN0feutoPi1EbK/RvwP5egx5ysUGZNErI+1vpKbX2VZFHQLlziGyxVLYI9aCQhgwZU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKjrJvvxblRFnRu6goQYu+F2JwermjzBIxAYog/aL5iNqTcp/fU
	wOgq3NjxeUsa56R/RiLGl/eEop1060MyJT3wqxa0M27Ai/Ob99WJwrS7
X-Gm-Gg: AYBFou2E0TbMS+mpuMBrYPMpRcAC1VFg8QSLwNOlvH1KlGN4PTVe70fjY0xreJ02MuC
	C37xMUrLO6DAUwo2ZhoDXANBR3ZYMiD+4dXSkce8OhM11DP+ptBcAcH081+fswwquEvGywjq6eh
	+KA0m+dxvpPxyYJZG9TYAE9aVhtUKhxZ2JXUTm/GPiz52avSoLjU6qqqIkZYUyeKKaxj3i99eZg
	mZB9SV2G9mUbk+qSlA1ya0+EzZN/JVSAPoIAFnlQ08pPlwj+8cTIocqoml00+4P/qF6FcU7Aad1
	AZ5DfrrLcZuZEfw4JmvpjAx8NSTvk6fqMOCMDbnFa4YqH2fERGKjEfWzOp6aAn/P+vnyev/zrp6
	NuvyS+7WagFePXpoKLoIYl6lDNJUWka9jLhcXT+1Q6SJZZU91yVHNU/9jC3k2fydKQ7iM4rnReH
	lqieT6yqMQR+hB3NJIlc7BG4LxM5mwo1dXWbq8qhmzByvIxSp++SBbjWB8sNpO106RPRfyuPXbt
	kyfGITwt7iZb4lSHUwflIpp3LqB1b7YAN/hb6e3oqGjMN1WXuAvqWDP9NJ/FapcakcFfHTEmg6h
	zLTtRsNiwEKeg1OUQg==
X-Received: by 2002:a05:7023:a5b:10b0:147:d430:7322 with SMTP id a92af1059eb24-16a5bc5bd84mr43402195c88.1.1792157607982;
        Fri, 16 Oct 2026 06:33:27 -0700 (PDT)
Received: from cachyos-aura ([45.112.151.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm7230494eec.23.2026.10.16.06.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:33:27 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] mfd: intel-lpss: Set d3hot_delay to 0
Date: Fri, 16 Oct 2026 19:03:21 +0530
Message-ID: <20261016133321.49288-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <atIjpJn1Y0GPmQbP@ashevche-desk.local>
References: <atIjpJn1Y0GPmQbP@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 16, 2026 at 04:16:20PM +0300, Andy Shevchenko wrote:
> So, do you state that this patch fixes some bad touchpad behaviour? If so,
> please, provide some logs.

No, nothing misbehaves without it, so this is only an optimisation. It
shortens the first touchpad report after the controller has autosuspended.
I went after it because the driver already clears d3cold_delay and the
D3hot one looked like it had been missed.

I timed the i2c-hid threaded IRQ handler for the touchpad (CIRQ1080 behind
00:15.0) with bpftrace, switching d3hot_delay at runtime:

                                   d3hot_delay=10   d3hot_delay=0
  controller already awake         ~1.1 ms          ~1.1 ms
  controller resumed in handler    12.6-14.4 ms     1.1-1.9 ms

There were no I2C errors with either value. That is about 12 ms saved once
per idle period, which is not much. If nobody can vouch for the older
generations, limiting it to newer IDs or dropping it is fine with me.
