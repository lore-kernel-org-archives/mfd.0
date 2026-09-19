Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E06F3B47C6
	for <mfd@lists.linux.dev>; Sat, 19 Sep 2026 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789822903; cv=none; b=oU+0FqoBlGC+YxgKKmgR/x5Xus871/OU20VJYgHVE+VBo8vuWM0Kz3cCbYxR42Yno3KQ3xCBobhOLFL83wWpXz+L0b//gGAvqDNIPdkzYKM1HqUm5DbOqcbSNLxJgAUeQz9LKG1EGuy8z2iQWvA6MLwtTvB7JRHCtDAByT0qBXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789822903; c=relaxed/simple;
	bh=uA+HoBevpg+o3pjy8ENPdza6Bd76MyHGiCyS2GIOcHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q8D1CfjrhuuIqBttZEYhr98mC/7LAqfoF3pKQvofKQIrRqOsauJldYK7pLIz9uXieSES/gAQQOQdkQvFLPCyqmvLD3GAsMx6KyLd3y+VWAAF/zVEaBLBaBkEdn8KI37WnWpBdEwwdHvRoqhIFHTCBbCS/Tv3UE4pJiaHYQ15o7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3GQjlwm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3GQjlwm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso12071465e9.2
        for <mfd@lists.linux.dev>; Sat, 19 Sep 2026 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822900; x=1790427700; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uA+HoBevpg+o3pjy8ENPdza6Bd76MyHGiCyS2GIOcHw=;
        b=o3GQjlwmKGr5WWDx2FFvP6SLUZFepRk6m5d0HwiCM/9Y1x9NBqMuJFNfkRQNheaAWg
         zLCvT3t3Vgd1/8w3wzdy/rqobYerbwDElBwQ/sPsiEuZ8ge1jTvpGIjgv3znlyq8m4RC
         DbWD+Ep2AO+f0YFOAAz4jEeW4CkRc5EojQevQFXbinYYl9AQqnEBiRTcg+n7Iozos2ZC
         o7MNYkNOH+vE3OoTxIIIahVDnms9JOKNboBsfmuZb9WcAEU8Nw0GgWpQQBVFSp9FmA57
         FmHkVstv/XnNNQZJTr0cpjnwVvu9yQtzp4NMhrVD5PI4na95mVsH0Otuwlo4q0Q6pDUt
         xjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822900; x=1790427700;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uA+HoBevpg+o3pjy8ENPdza6Bd76MyHGiCyS2GIOcHw=;
        b=dSNg5Mp7lR0uF/cbda4ZX0ZDLvveoRSHeWSCFijB/rOntKXBlx4kz9M3Bnx7jV+5+g
         PdjFkzUaCdK14/G354fig3D0miBb/cgLAfUe4h08QhAWLVXtHpubh+E7KDXnfhJHHXYD
         EVEzvfl93Pw3Q4FzGaQV3sdEjYe+kf1v9Ubr5RCKSc19wPTydtEQKsrwopAeM+25eD5I
         e1XE9cSiF3jvIsKrwqvlpBwfObEK2tzoddB5/JFtfst0qlL0kay5oeQgecUoZjWKmjub
         eo6r4HjygCnLLDOtBcnk8mzVKv/bquthvBF9hSvc1Spwp1JQ7T3DLHeayOakIYeDtWGV
         l9UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOMos28i35QdzfiymOKsXq7bHkWiffij9qsiYjSMFo+PyLpn49L8gL7xmGgzd5Fkea5QA=@lists.linux.dev
X-Gm-Message-State: AFuF++n/n06UJl9sVmOLVN7Ht2YDau3tH/B4tPBM+VUwWJDo2V+KfR1y
	JTzIV1/4kOk3VC6UWmNM+DvW5Kirv8IITPXs5bTr9NMTy3bh5UuaADAa
X-Gm-Gg: AYBFou1lBQnbEMsdag21N7mR+yzaETBgJsCVWhEJQcpLBM+hK/rP+mYhpq1jyl9n6F4
	00oATh0K3J6Gf443efksRuo32MPE4Wue8F54x4dhz03vEvT6vLWivRNf4ToljH/PHVkYs09XjD+
	NJj49SgoH7YG6v0E+MfTUeQaSxixRjbG3xL5d5fOsnhSwG3LncS+wremi3aMeWWtcpj91VzZRGD
	81mON9H+xdtx8RV6g2WdoPhpRpFNLLQP38Yq5GLRC3b3Zb6/A0DNt5JCysd7PRKNnavxfN83R5m
	kGFnWLLfSL0c2sAVcjMFsMOAmGItkBqAJCIImVMbm8LoIKnIZpOnK2/grvVF8eFJ5bm8FVyZ+SV
	qtS/s9AOywR+MHDiEvJlEtS1CjcAhxJNQ286NUXaRaxUC4ekgYn+8lygizWnDrp9fnTH+j+pHGv
	8lRMyx3Pbx1oGRJ1/YemNqFQJVfYeRhI76QfeOxSawZc/LIbB5//EpCFC3WOGXvX5m1Be6mSWD+
	JgEHpLL
X-Received: by 2002:a05:600c:3b05:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49fc574194amr69801595e9.32.1789822899376;
        Sat, 19 Sep 2026 06:01:39 -0700 (PDT)
Received: from localhost.localdomain ([185.40.61.191])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fc52a5b6esm65037995e9.4.2026.09.19.06.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 06:01:38 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Sat, 19 Sep 2026 15:01:28 +0200
Message-ID: <178982288839.2267.636188297415440296@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jishnu,

On Fri, Sep 18, 2026, Jishnu Prakash wrote:
> PM8010 is the next generation PMIC following PM8008 and has similar
> functionality, providing 7 LDOs that power camera sensors and associated
> hardware, with some differences from PM8008 LDOs. The series also adds
> support for skipping interrupt configurations which is needed to support
> SoCs where the PMIC's interrupt pin is grounded, such as Glymur.

For the series:

Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)

PM8010 at 0x8 on the camera CCI bus with no interrupt line, on
next-20260918. The MFD and the regulator probe, L2, L4 and L7 power an
ov08x40 and the camera streams with libcamera.

Thanks,
Oleg
