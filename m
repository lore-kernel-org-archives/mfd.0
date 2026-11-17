Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794876103;
	b=xO1o6fYTLS6zMxBM/GP4BD1dGZQ7mlRBDWD9vQISa1Lngc2c7S7NVbUgPnl2uoQgz/dL
	 XGXKVXwaLItQ4MyzQDo1hxolXShSHh7QfjUd4DLzGCzvVRiVfK3zbLxtJw9NMvJIA9g5Y
	 yypDPDhewb2AAlt0Cy2n9tfDQ9vxK0oRTpUYEPg/Zel3aJq4JccRGyHXKQ8+laN+3nTsb
	 tiMzPxIgmuicMTlYvZfjgDnmHYjiOw4JlAhNlLa7qXGBpeAHlVYgKVXimp0wNMIMrMNhQ
	 N02w/6dAvKWu+clhLRApmALdN9dTOAx5qEq0jOwSvP0w9hOLyUkXr4lo2EEKhQqN85w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=;
	b=oyVDZovTIgTPv3rpbrEXErsl5/MlV5yR7wJyigQ8IswsKJT8WsQm4NOytkmaDKfpugXE
	 CrfM/lwoTacvFWdMFbI7r/Pr15dGbjuBrXVSnz5y/B1A1t6RmwglPynenvvbQ6ZFZ+8UM
	 xGy5nZALPqKhuk7CUVOtrMpVnx56PA0Y6sGeV5LLjOZs9BKO8Ia8LeJtjfxp4XvdkuYaX
	 ByTFc8ADhF9TBG1+U8ZHTKz+rYS/WrI1E09d4PXdwVMM6HCCrUcGxxKaDnqgwiJyGkSIH
	 6EQ6n+3rxp6RzeidoyNF812ujJIJkxdyO4/vRPSGtx2zzsJggip17gtfookPiFg95Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ilkwz5wN;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ECC606A31C
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 00:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1ECC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ilkwz5wN
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2efc5a60bd6so5728965ad.3
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 16:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794876102; x=1795480902; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=;
        b=Ilkwz5wNBMDXaMnBSoIxD5YJOaKPqXhiYtYy+UQbNXmXaSrj3HRBywBNB2YA7E6X8D
         L+FFoKJBREt47lJjtJ6K8OHUn10ipzdLNA0XWT+3f/0YV9GX0tUTatXyD5NrJVV19Mg8
         CtOYDYaTvpBGQ8vDPtQrRylSPaX2yPQK4++66Der6iQNksAm9CcVkhuxGczioPgW7453
         08DMow7Z+Lf/0wvcoDXou11/TAB9toV23gYqgQIR9z/mWOWB0/NHuJPMOwaFmEWWNQOz
         pS6FJEmsxydq5KZuW3JrjT9Wi9Xqs0A/0fZMnjDW/IXTTS2f6/YcGq+MiBxYCkUPs73N
         kJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794876102; x=1795480902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=;
        b=r7T1FrSJKO51LchUaRn9X89IULCsrhv1zzk2llTtps70TNaONU9jKSxPUGjqbO4Du/
         WngmEzgGNEv9OnnU4v7keLm172dIoWsHakzGpPDp+VRZON555gAmwJq5fWdQ0R44tqyS
         q+b4vXO9oLK/iLSRSguoy0Zpt8onSaJ5zZ4H9zxsSnZNCYwCJXPcr+SoTkVxeovTbJlQ
         iDt3TxDUZQ253aPYgA/W7xP9fbrT7tkr9kansIi3D1AOMBVzkjsN/wfkGcAq3MNi0LgT
         AnIUtvhCjU1gh1ntOpEuahF0KjYpx3sA7/iw1uaMgbyLadpLjK8xi9g+COVm6VvqQhk6
         2ufw==
X-Forwarded-Encrypted: i=1; AL+hErF+BZj3gr43cAN1v2op2Nw2ixAzCf44zh5ZTmq4lW24zO6CkdjNebWmk8gaAawZJ/8q3h8=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Qkgw7elbz0zMTFXEH9caS0CQAhDiyVSPrVIBy0Dybis8kaLeJ
	INz7e1xyOaTMgpWCnS5QEk/rQSj0eXtLvTDaT7lfdwnAkSamjeVBjpTWT+vkypar6w==
X-Gm-Gg: AZFdTZfD0aw7OH4wVnEltqApaffzKxeHlDiSB0Snuwfdjg1eu9Xb4PZM2DmF478/0vo
	WdJfpjCRF9tQuF0FJeZl8JQzOKz/uDHEhaaau+/GlETjsKQCHmftYnouR4+CTWsF/hVXh8kEOfr
	sgo8I9ymT68FFLv/wzLlhf6W6rjJdxWoNtQKkF2g8b1wuETxq+b3eTZJ40ikZuTWddaMFQ+e3yb
	npOvgX5QmIzq1E+Cjo8myLQ+bHJr1if9rzX60CSXHTR1n+AjCjofY+m9ZCVCzLuFfn4Q3dxrVjb
	q6ZsQ4j7j3CybDDPiL0LpfsY9qR73QGy0oQTDk5Li0RjSZEPYG3SB6Zs4Iu+t/3SwaIEP0JaAs/
	8gKkJLUKdW8j3gjcFHoLfG5JkKWvjdG96QCrthUaCOu9m24K96fuirSh54qvMoAgIOvu4XssJKC
	bE+NnEl4IG5gffpt1X+bIMG2kpvwAsZlbDtwpIS/JnvD+MM5GOkdTc2fhjp+DyzUx/zKC3z8dNu
	9LCDNSgJChujmSovHAVJ/3sjHcFtQXMaxQjs1QYKBTLgiRIhwwtF5sF0YRmYmDirNJ8YvMAp2+b
	qUsHXPFeALKEEUOH5PUTglPBywdkhRNijmN7owMEgr63rrPV/3p1o9q7H0JEraW7/PzL+pdBzND
	UmwFSDj5R4PIFMe/u6A==
X-Received: by 2002:a17:902:f687:b0:2ed:3c11:67e with SMTP id d9443c01a7336-2ee0dad0688mr134037395ad.24.1794876101909;
        Mon, 16 Nov 2026 16:41:41 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm5594825ad.4.2026.11.16.16.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:41:41 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	s-vadapalli@ti.com,
	rogerq@kernel.org,
	bigeasy@linutronix.de,
	martin.kaistra@linutronix.de,
	vadim.fedorenko@linux.dev,
	r-sharma3@ti.com,
	robertcnelson@gmail.com,
	nm@ti.com,
	vigneshr@ti.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE
Date: Tue, 17 Nov 2026 07:41:33 +0700
Message-ID: <20261117004133.1594972-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179446830443.2199510.10552580927894870264@kernel.org>
References: <fd826c118aec02c06bde92ff9c20f1958c214b3d.1794284248.git.jjc@jclark.com> <179446830443.2199510.10552580927894870264@kernel.org>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> [Severity: Medium]
> Is it safe for this driver to own the EXPBIT_SEL field of GTC_CFG0_PUSHEVT?
>
> The register belongs to the SoC-wide GTC, not to the CPTS.
> am65_cpts_ptp_getcrosststamp() rewrites it on every PTP_SYS_OFFSET_PRECISE
> request. The previous value is never saved or restored, on success or on
> error.
[ ... ]
> Suppose one of those consumers expects a different exported bit.

There is no other user in the tree currently. If in the future something
else in the kernel wants to use it, then the solution would be a small
driver to mediate this. If there is a user outside the kernel, I am not
sure what you would have me do about it.

> [Severity: Medium]
> Should val be checked here, to confirm that EXPBIT_SEL now reads back as
> AM65_CPTS_GTC_PUSH_BIT?

I agree this would be an improvement and I will do this in v2.

> [Severity: Medium]
> Should a failed syscon lookup be fatal here? A bad index just below only
> logs an error and leaves the feature disabled.

A ti,gtc-push phandle that doesn't resolve to a syscon is a broken
device tree, so failing the probe is right, and it lets -EPROBE_DEFER
through.

[ ... ]
> With CONFIG_MFD_SYSCON=n, the syscon stub returns ERR_PTR(-ENOTSUPP). Any
> DT with ti,gtc-push would then stop Ethernet from probing.

MFD_SYSCON cannot be off here: TI_K3_AM65_CPTS depends on ARCH_K3,
which selects TI_K3_SOCINFO, which selects MFD_SYSCON.

James
