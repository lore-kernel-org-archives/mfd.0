Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821554;
	b=Hr34aAzCBCjOdqTbn+ysJJCXGyHJ/WJzPT90Pj7uitl40XV30IUFOLd5zjWeYNyA0plb
	 nNOsnQ36AC9Vqasezr1eX9Sm//eonll4R3FkHBK/MJya81np1vabhfxToLjgWYDRxFvR+
	 6vZv2EPxWIzxkbtCtB+vmOMMX0Pjp6jXrbJ/RbAGWIpekwNZ46GoopgZS8PMRN5N8cP9O
	 ZJw83WKFQOekxBfgU4g8B/4AU3s1rcsf5wP58PlhIVpz+6OYfTv2UfxuFTb25hq+8D6T+
	 HkRTJC2vnOH83bHmSe2XgUcX7oaYagJ21aHaOgF2rQwrixR1to6xcNe6xUzNVZkrJxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
	b=tFri34c3kBcM5IIgPG1fvG7A01fnqBqXFvHuAa7WnlX8GDklNj5f58MYx13siUwDFn9p
	 EX0jRoTFt12bUyzQvmwO38WaeGUyvBj+uMYpq0cwjxrDutyqoStegbfoKtX8CYQ6FDRY8
	 u1wOAffOLMUGZSYjLgu4Wrs2nmxLjMyryFcqotOn+WcXbm45x6amIvBhT9aOY9VfGsonL
	 Ns96x8ewinLCYbzSakqbd96EkD2wbhiHItK26RNoJGC0OFfY37sFtQ/JjWadpjHHyNwsu
	 ZWTebPKiZVbLXCHx07MQV42ZS8ADZ82Rmdo7nMErxX+2/yGaICEZWYe4mDuU2Fh8Vjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlRWWJ1w;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5C4608337F
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 19:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A5C4608337F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlRWWJ1w
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b244fb7fffso1559744c88.1
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 11:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793821553; x=1794426353; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
        b=wlRWWJ1wds/yHz4XozhhxrfJCtF09En1zcZOOhr7etPStEiIw6uAduzQep25NwFLxF
         +Ax4YvV54pHSgkdelW/zAWJC+GAjiP2RdEzwg3YidnCyWtVchrPsuAH6ZzwhX3zvqNpd
         pPVDrAm9TSi2ZnY+axVfDXsPIiYczEPRySyFYQC0+U+htbumvM2cohdJbmEaALuztX5N
         nfj4lYAa/UN2Htxq9wdKsncS8NtvQ0T4gustcBRlLsIgcpkoHAAd/PfKiFPuPDkiz24Z
         PnJvDhpRewILTgWLGTYQtEfDSgBw/LdXBdZGiME15pCxXAVcGb2o6+eTSw+fQr/S8f0V
         dIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821553; x=1794426353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
        b=ns2FXIsKP0rJzhDXq/IA1/sMWx9D4gO//vUsYKCfgMj8QYzbfpVw3gMPUFN7BX+tUH
         oO3DEfoEe6bpZ3P9Hw5/Y7K5DyJMEvTT3OS5BTqqnwlec9t60W0qtu54HKWvpHlzdjDt
         f9s1AjJIX4VNlmQaSXJRqzVVkj6A39hvGXwRlCPjxUxAHLJP8LS0WmHczVpue1JnFMJa
         Rt5xPenB05V7iIujALuhLMM//otl435WdYxZh+Xi2hMKHMVQ3SsBkQwzG65mAmdPbeSR
         7WNYITYgkkiMEXtQjvT1twRVND6uzWCW7foeiAayQ1EfKVDASwKa/yHAH9j5FSJmiy2i
         DVHw==
X-Forwarded-Encrypted: i=1; AKwUvByEXBlea1r/U1U03ZxFNIKqgPHSfqv8RzNlhjxPU4M+nc/ZVU4kT5JVzwsW/C56bXBi1MY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9uIW/flFTIK79VOkeppH5bxSyBbavdUYd+Naa0NOrv79Kpsgjr
	00wGxTb7qe1ApWU9Lz5jmZ8T2q4PGYhuUcSDD7IRatout6zLbw8yDfo=
X-Gm-Gg: AYBFou0VKFUW/qBO6hNRJbADtrLhDS/teaCqWKnqN4I+/pIWBRZQ6uFXCazOSkclh2S
	ZDT4MBXCeIEJFtvAqDNB9dkCjUCAu3N/dtd3sd6ra7sDStqNghi+hmxiAEpT2hMef60e0TeyVWa
	y9s7lWJ50CAbKVWPdU5WAOSOqFMN8LauaGS1hGJ8OP3Ecl17mOpYBV61Xt50L25cgaERDNfdAPv
	vXQD1Cnwuxm63K/EQFFIdd16linQ6ye5T44de3UBQC4hj0kpGPyuqmdmm57qUvmLgAL2ietDL6B
	SR3bROIOUpynor5YPliuDdKjWTCxLsEQY5XfdgnJRJfkEX5BOrACv7F59jgdrHgF/9HFDJ4JO04
	x1XOiRO7ftZmkaSweDjvxEMCxdDqxk4666wnk1P5J/d/ZXvW4Zuojrat6GwEVJi+uXZbhtHIlhb
	CqfHwnll3jB6ADmJWN/eQPdWZgwX+R6xKyg4vpkyi9GRLBDBkahVzEIaixpPvCF6JVyGISvSLa6
	7V3TQPYR1253aETSZ9lObiOqPuQqWptC2TY9oH5OCofsQsJSEUMc31ZqRG9Tcy8wVFQufPIT6i4
	gt8NAhrwSny7IEeTY3woHJ7LA9lX5jE269EtDK2heGErj2zHV3hzaflhyhmfCco9Eg==
X-Received: by 2002:a05:7022:3a02:b0:1ad:e740:e51e with SMTP id a92af1059eb24-1ade740e699mr23857533c88.42.1793821552953;
        Wed, 04 Nov 2026 11:45:52 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.194.66.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm8652168eec.9.2026.11.04.11.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:45:52 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: jic23@kernel.org
Cc: alexandre.belloni@bootlin.com,
	andy@kernel.org,
	asahi@lists.linux.dev,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	brgl@kernel.org,
	dave.hansen@linux.intel.com,
	dlechner@baylibre.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	griffin@kroah.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	j@jannau.net,
	jarkko@kernel.org,
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	mfd@lists.linux.dev,
	mingo@redhat.com,
	neal@gompa.dev,
	nuno.sa@analog.com,
	paul@paul-moore.com,
	pavel@kernel.org,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	sre@kernel.org,
	sven@kernel.org,
	tglx@kernel.org,
	wim@linux-watchdog.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: [RFC PATCH 00/14] Add macsmc support for Intel Macs, replacing applesmc
Date: Wed,  4 Nov 2026 14:45:32 -0500
Message-ID: <20261104194532.8259-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101010737.203951cd@jic23-hlaptop>
References: <20261101010737.203951cd@jic23-hlaptop>
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

> Are we looking at ABI changes as a result of this? That
> tends to happen with split ups of unified drivers and mapping
> them to more standard kernel subsystems.
> 
> What is the plan to handle them if so?
> 
> Thanks,
> 
> Jonathan

Most of these changes now expose the stats using standard api's, so this
should not be that big of a problem.

The worst possible thing that can happen is that, the user will have to
change their fan daemon (macfand/t2fanrd to any other standard fan daemon).

And also, sorry for the late reply.
