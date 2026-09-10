Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D20B472096
	for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 12:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044762; cv=none; b=hfguhZx8XuNA/hH1nqqGLp62l63tg/Xg9rMlEAKfxNMF8zlhdk0BNPK9Buz/7YbkoFDfW+1JK54ZOjLW/btCDLbZzrMzZnZojwL/ruckQXiTLB7Ma1kwicAW/jxLeUsQEgbTbf9PNbY4gQ8JhbQVqD2XP1VGSQzF4r8bgooHPU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044762; c=relaxed/simple;
	bh=3rPs3zLWmwVwvVVM+gpBKczZPikUN8Un/vHgeN1cX9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZUifwT+iveXtIEvl33aoe29rpetLJZirZ2rGpN1fzMSiCfpC/nIq5m2WsKEFoQ6I+6ANymYU+yCKlF3oii2rV5VWox+qmcCeNZISTvgNW+wC5PP3h1C+HiCAGypOydPe+dv5m2+8H0EnLRAXyRKDOZ+MmUZjl2xJRuReAyo78oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFGCtfI7; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFGCtfI7"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff17443dso18210041fa.1
        for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 05:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789044758; x=1789649558; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3rPs3zLWmwVwvVVM+gpBKczZPikUN8Un/vHgeN1cX9o=;
        b=NFGCtfI77gjLEItBo4oYSqGa7hTjQKoipgeXa9aTLEnOJRh7WH0DVmERCkI7iBt02P
         wivqWmUeCvnydQ1aSl87VsZmBWOEn4FRTGuG5Ywt3O3EgE69V0BnUI0lLp1D9/VY6Kdm
         emOX2rF5Q7tVZPiwRvfhpiGiIt0gzrpou4XabSsDB9nyPSCycDFj9zj9wFw7ubf6XKxx
         EL2OpkfnVz7Iqx7/KaNp7Zv2doIznsEPQbuZ2YbZjEBhQpNp4DfqwXejwE5vWXrWdNp5
         MnazdVQeDsPSRiquh5DpJ1JvbG07l2NWJ5gcJ67ktduoNd9q1Lg9CDvMfEdGjqtmADmU
         yfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044758; x=1789649558;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rPs3zLWmwVwvVVM+gpBKczZPikUN8Un/vHgeN1cX9o=;
        b=WptYpNpvWAjNMUtP2hlnWQ8ks+MnfciuHdt5k7/MIzF3AgeweC3dRumdh7eB6lSYay
         +VY3Uq2sLF6gGaSoc2k4NSQ4RaxKddQQofcn/kAryJ4l2wJw/hkk0xcP1b79qY1AJ+9z
         nOuUMW/RWEy8tktdwptan57ORf2+qA3dM6QOhoyAw4WpeBq2Pp7bXpBjdQuiervFwdUl
         eR0Uy6rGfvwKYdxXKgtbW36RQDQRmKTHn4o9HpJa9ktIFCo0ZDFxTBUQjneGeLds7Ywg
         /mEnxOTfr0W9/6eWXoL18ULH6beSQLaAOvdo+vymDusqeB367iv+KBgyGTMmHewt25U9
         tevw==
X-Forwarded-Encrypted: i=1; AKwUvByJVTZVURZ6cisqrPmB4ZDVohEM6ds1T63DjBRZKPoXsWBfXyzwZipr/DsRzicbWAH2thk=@lists.linux.dev
X-Gm-Message-State: AFuF++kxBF+6IxMpLjeLLUTSJi0FoUtKyhCsU6syCBW9CH5AJYCtpZPh
	XIiu4I0L1cYBXyKlJbYF4LWda0ftysYYXhz7t7adVBhwVqhMRKAAL/avvwl0dtKVzK+RZA==
X-Gm-Gg: AYBFou1IEHQQlm7iVKhf4CLZywi1JIzLmiU6AGOTYflyAdqiDViqoQtHihPvaEqL6C4
	AkGtJfMOSU303JM48OPYbgnfGpWe9WYs7gMBd23sU6vWZetSjhf+00c5SEmpSE8QsvF2kX/JmlH
	lVXjjhhSjD9KesMX6Mlaz9Nm9sRNWcsDOGihjo0HnB+9LcxxOFgIwKvOiPnMDNmIIJ1p03atDro
	srC09+jWXiKjZZ20FRTp2wLofeQ24qUYMsq1fSlwOqEXQBp9dcOwQdfgY3GYK6wPtffmOsLrG/2
	2hYXAuZh+/RxIiPKlNMsGKfeAECIfmdN6C7DlzQLH/hOqDOsiwYc5VHk7irxubuaNz1BUizIm1U
	cAEaH8sLoedG8wP5oZonc2lsNetyrIXk2tC8oxnmK6S500Nq+kweOeYuDb6vDTaKjKIJK9HupYb
	3z+cIMCKdkingdya8tPYZ+e9ndFiXlUi3LO1ywAbX1Dni0QfcmpAfR5RVgbSfkDEtctlOll4rnW
	DP0MimeqwMaqMLQdiyqhqL2ooH3M6+LMSXLWB98bfE5pA==
X-Received: by 2002:a05:600c:45d5:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49d258f1d5cmr135945565e9.7.1789044275597;
        Thu, 10 Sep 2026 05:44:35 -0700 (PDT)
Received: from localhost.localdomain (mob-109-113-160-48.net.vodafone.it. [109.113.160.48])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm144440305e9.3.2026.09.10.05.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:44:34 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: jishnu.prakash@oss.qualcomm.com
Cc: konrad.dybcio@oss.qualcomm.com,
	nihal.gupta@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	drajpura@qti.qualcomm.com,
	lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@gurudas.dev,
	mfd@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt line
Date: Thu, 10 Sep 2026 14:44:23 +0200
Message-ID: <178904426368.12167.11218867694394370234@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
References: <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 14:40:35 +0530
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:

> Please note Mark has asked us to split the existing series, so we would
> be sending out separate patch series soon for CAMSS support and PM8010
> support.

Great, I'll test the PM8010 one as soon as it's out.

> Just asking, have you noticed any boards doing this currently ?

Only mine, and it's not upstream yet. Konrad's list is right - those are
all real PM8008s.

One correction to my earlier mail: the compatible does not change what
gets written to the rail. set_voltage_sel() writes millivolts, so 1.8 V
is 1800 in VSET either way. The wrong compatible only misdescribes the
LDO's range to the regulator core. Sorry for overstating it.

Thanks,
Oleg
