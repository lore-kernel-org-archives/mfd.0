Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334697;
	b=g1rPGEqtLGsGTXj6u+gQt/KjO6ZkyWkVYe8qEb1tP+XRZ+jbes6xyYWTnxqCwjna63jc
	 pgh0sljxCVHdHEOsBJJ1+fYOugyTCpkCA9LiYhl929pB3WUJIHiPJhgyhKKbM3Sah/nFl
	 JOa2zlZx/0XCzioR2emVdyYrIr+QvpJp76DbvFOU1sAdGiEIYD1xdnTgYTFxdpMbCJXGs
	 MX0HG6EEoEvVI2uCJGdnmx68nR2tXci/N19dQrK9soVFH7hX83VLrZvl9XQjwe+FWpmUl
	 0JmcXYYsQJv+zTYiyLXDYnnda/TsnVugjFcYOogN7gkos8s+wziYAFE71paQuu+k8Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZmwcF5wgt9UlbFWPL8zpSNJ6XTb3NksP2KGyLQtzBDo=;
	b=Ks5vRKIrtSrvKdpkuQrpzhIL7M+pWpzgAR2R0RYWi/dH1Vj0grgC6yPzWDy/KebKGenB
	 SYlGr9BwgqB72vTddt+ricKU33CbzUSIXgAfsoKuDVmxgnhjKrk61WUVD8+yqp8GpLjQr
	 HthIYZUiHNfrSjh97UBli4eennsoXn8iKBse55VKvABlX+j7K3qj+anbGFx2geEVYs8to
	 Aat/2l9087kNDTyHn08Hgja9bt1LsHQ/KINs8TF9w43FKCII5C/iMhJo5hplw6vv5EwoI
	 73798A+7Z8Uujpz8T0QO3OsLo1X6OtpMZp06Sv0Vy/fesyry6u228TvA8/za+YCGlZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8cSoYxU;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4BC606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 04:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED4BC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8cSoYxU
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso1764905ad.0
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 21:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334696; x=1793939496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmwcF5wgt9UlbFWPL8zpSNJ6XTb3NksP2KGyLQtzBDo=;
        b=h8cSoYxUfEqkxVXna10ZKG8jRyK7UgGab3IpC6uru0zhvBrR1lqUhZF37159ytWbWA
         9gOZDCOJw84K7PLWmEzVe+M+0LIsiOzliJghmFdlulXa+POGr2fvrex8U+QLgYpr7OX2
         eqlbWLY5JJNDIu/Ag5Ak3IHE1c1TbKlJXNqjYYA7ccEqhKiwGCs45K46cusyL7b4zLyM
         4vl4Jvw/tjT5MOgZwoXraXBYLBsCWOtp4rvbviCeVtHKa8dYp+QVjGbtZM1GsesR34s4
         TtQ/WFtMMDIF/VkitND4hoPP9ssx5NG9oyHjNT/rqt5Y4fJAuya6aw1LiwCaB7+c0qVg
         khDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334696; x=1793939496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmwcF5wgt9UlbFWPL8zpSNJ6XTb3NksP2KGyLQtzBDo=;
        b=XE5nP51weyx9068drgqPEMa/S9rW87erI26N4qbDahUjqA7M8LivVItQImroMQ6PbN
         gZ4/GonPaJFyzt5D9IhIDlPYIBK3UMYaL4KUl7fM+lTCGoh7UoE8IFYiFxaMYe3sdRrT
         gH2CmiLemuRgCqipCldXAl8En6OlyTJ4qIgkP/zRHkDSMRtYPIZh/olsYlQDqOvdd7eN
         J+LNue5DdDz6KrLrdtVKHt/KV+X5qDLtLg5rWBJ1ZQUrcYnKREts/ixfpg1niG83Dp5v
         rYpNUVr0iHXWvueSKmwNsavnoNvlzHkkjUQ/ELe7CC6K9SLEszFRKnZBJH2WZDAgvD3A
         CYZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCdlf6EsNN3q5+BZ8XidTu/xtCC5W5RjcSXFE5usS1GFJxowe/mCNknOTnRkZqrEfW8Xs=@lists.linux.dev
X-Gm-Message-State: AFq9FYKv2LGV4gB9pEMGWzBtUhsuAEgznT2bif3/OQV+bTlvZi6+4GYj
	A0nFa8taApZqGoowq+cJnOykigF6IAwZiZr+CaSdq66XCzjqzvS7z5U=
X-Gm-Gg: AYBFou2gKqmbZeXpXBD+ZoIvL13lpkjGE4WeM+MceoBluP8cw1LXEBMoqKK+YsU5p67
	GW4fVV9NB9ZxN1uodgQ/BXnkzarblDecuTjdspnWlPGTMHpZN95DFpoXUn1q2738C5OovCwDeTb
	MUvoHAqkZRyvB1WNNnjtI2w2xmczTbmz8Ll8vu87/aAlufP+OfSWbWm5OP0hWtV9o/xeo2+Xvvc
	5PG4aQtKdlw9j3Xl1tIE/VCwKGAYwAp5Hr+mZ9N3EzLs4rDhpVbFAR1Jfw95aQcFzM1StrxzdEU
	RThprIQQA27sGV/4UKG/jW3rVbaQhGKgLRBIr6FJjGTUMgou6t+vkUE6u0wbxrCSAqkMyeiorrF
	cNssmKlqlKouAUxqrT+XY4CnDbbolvrBBIJKw6DZtkB4jeQoBY5WzCpdfT4ABzLkqnbDMbMGqfm
	pGeLQzDqhy2bLz+rCXOpT7NIef6wbcv59a0/2jrGGS9USkLnhklPqK6lccbPfADImZComXgWBdM
	0poHGVvqnRXu43fnvM1O6NoHrLXEPApmmWOGtydIjMyfwf7E0gD3xRFRThqrjXg84qtMYGGJvv9
	TKv9SmKuKg+OwoYV4X6tj61zRPd4nLzgJI7H9/wO2LOPxlJBPjXDMfQSCof2Kx2th0ug+NFqji1
	eSb74tVPPWRe4Ug==
X-Received: by 2002:a17:90b:1a85:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3ae898194acmr914461a91.36.1793334696274;
        Thu, 29 Oct 2026 21:31:36 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84596e3bsm2259922a91.9.2026.10.29.21.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:31:35 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v2 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Thu, 29 Oct 2026 21:31:31 -0700
Message-ID: <20261030043132.2746814-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
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

On 14-Oct-26 16:01, Jishnu Prakash wrote:
> The series also adds support for skipping interrupt configurations
> which is needed to support SoCs where the PMIC's interrupt pin is
> grounded, such as Glymur.

Tested the series on an ASUS Zenbook A16 (UX3607OA, Snapdragon X2
Elite), on v7.3 plus out-of-tree Glymur platform/board patches. Its
PM8010 is described without an interrupt, so this exercises the
no-IRQ path:

  - The MFD and regulator drivers probe; the three LDOs the board
    uses for its two camera sensors (OV02C10 RGB, HM1092 IR) are off
    when idle and switch on only while a sensor streams.
  - Both sensors stream through CAMSS: RGB at 1080p30 for a 60 s soak
    with no dropped frames, and the IR sensor at 560x360.
  - Both cameras still capture after s2idle resume.

I didn't test regulator mode voting specifically, or a PM8008. Happy
to re-test v3.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
