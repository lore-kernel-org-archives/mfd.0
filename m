Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284789;
	b=rkjquzoYBG4EdmG8vUREfb7SPDxso/gEjxxyiqsvWQTbdrwsrWOPVElMYfPRHK+43A/h
	 7quaADLDo1caWjWcZoc1CeKm0GuAdf0ptByazDEPdGSqv/Y59VJIZQvQWZVj03DyUxzAb
	 wFHuWAlu/xemeKb5hWJXw9oBFT7KzGMHaFdEHVy20aNlndufhI72WizzJu9t1LMoMdiyn
	 60dJ42pqYENwgvnxZDpKcS+tzfoweAhogiCjUUfq4zm7V/0Exyd07K9NNaWLSxdrygueH
	 ez/xPGF5jiNDscQnlyeNzYRVUDlXJ9zfIiy9fsa27atfGi1a8K5Wxtxo3yEQQ22AiOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
	b=PsBB0PdZlmdTBlBwKArIZr343bWc82+MXkj4pWu6PBLzWqpvhoxCuxBbxT/v1UEkSPF4
	 ncTGhDcnf78R4yRN1j6ofJKPuoinv0nKXpsaDYmLJG25SS+6D4af7lCVhdi4x/52Dtfc1
	 2JJz+aryCBJDhg5sGYNC/+90yB/BfX6eqEinxdEUwvafYjMD5TOzxIG9op4283bE0vBti
	 fW9QTmWe0gDa6JkDNH2JgCnhkmaq2rWEBBChS1IEIninTBIOeJuvp8N1iTulBZyiKKXBu
	 unyw87wbCc0eqQ/ubYmNHgVqmHTdFWYpyso7XYhY8ld5rbO/UlIllnEWbzybxX6Q/cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXYdkjlN;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4B0606A325
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 14:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D4B0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXYdkjlN
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14fc585291cso1992553c88.1
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284788; x=1793889588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
        b=EXYdkjlNqcgMFZO8rfzUyEUMOuQjVqw3ziZz8SeFpiO9+IopY1cHIR2WPH9iFzkTF5
         I6IAUjh3H7QuxblUnL0KmdRGYjnzafLa/SwcIp/CZmpN9beb66y4BrR3SvQEr22Ed/LE
         yqO9Npxrr5+hVx7uB/o1wUW/6GNRtWAMcm/iaB7LcZaD0o1R/jAI9zVF3jj5Pnn1Hxdt
         BOuUbKHYYGQDIWx/Wq2LurwjPdXGpWfhotZse0iM+Sf8qd46oT+LTpVB4x9s2x5Ee1Qt
         zZqO1FOdEaj9Dy/hVLreH/ZDXUq29uZDq+46G2lu5lJER+VIq3mh8Ah52EjWUFqptkri
         ayFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284788; x=1793889588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
        b=Uvo9XF8DLgtKoDScnolBbTAqGUSSDG8LqlkdbsHSQ+1UeKLkFc0gFU8Y7Oi2k8Ateb
         +DX7NvjUL0OQEPuM/ba0MEV4qHVx6Xrs3Oj69rwN1A4/3t3y+LsRnjw4nNbMii8ncS7x
         caccVcNzdhwzGm1EUswdTNJOPdqsKCGnoK1sJ/N6hNnhkKiRQIfp7BechLTbK7UXqZyP
         BEU4J3I2x00IbDzXpMH6LySItTzbdX0UabXDnisZDIxS9tDXyyiteWUIE5X6xYYHUn6u
         CDL3kf1XsVKUGdfs1xwLhxjSGOmpYTaoPiVirwqBtoYtD7IjtvvFO2xth52a1WYB8Yp/
         aBBg==
X-Forwarded-Encrypted: i=1; AKwUvBwRSS2MgvCORDAtOIag1hqxwIGvhn6/vbzHE8rHMzggr2PtaTRZnwpSP0MKs8Yhq/lsSWU=@lists.linux.dev
X-Gm-Message-State: AFq9FYLEkCT8SjeaVX9gYrm1hfN8eRKPN5MjTJdwoFqtLqzo1FpGBFWa
	wjCw3MQOYcjwkyI1cIk2+mC1/tXHmP4KSAtAE9VZPEVpywAGS+TcvI8=
X-Gm-Gg: AYBFou2CkR7ud5vN1Sw/m1ih1lyzGNS9CwZRw9nmHG8JUHTTvsl3SQ7LlONzTFi5l8a
	pcSbsZtldEyWVtefAlbh307dNvbvj+gnJL85Wn/hE4gu7uKIt3wX5zlsOO3Pdfy9yb5C8yH2szH
	r6nnuO883J39vZQRA02ivGfw5YfHCgYlb3O11nB/bjKowOPNZw2kcaWkbih2yJAHodHhwM9Z9cl
	zEQ1xO5ziSM4b1XKC9n1+7WUoTTObmRRvHtfrJDB4k0+JggKpTR8eK2QSJ6WbNQq914JbxsnnNU
	m4RPqNdIJEP3hTcvsnou6maEsZeX63QG1NUWWlfd4QPzN1Cfma8V+WV9dbvA9Lx3Y6JgSNIZxhk
	xDppAW0ePN/5LkHEttH1YS2zpchpyNBennuvA8ydfw0Sc//Iai1vOyl79SxIYymCEHmh7fnoEfD
	ku9mv27W+Sao18eDZjjyBqPNUfNUo36Nid5csWcg7DJxHY6y0b4sZr+fTgKhM0TH6VRfVNxz57S
	HYPDoE+r33ladTjq0YEdCHSur3PV6yB3hd5SVP95hakFM0s+dYiry38jpiLJvNbkTTKi758I6LJ
	PedwiXQOkjQoLt5iLY943HHlTe2zki4YEMMP4wvrM6Q+/gqjhHFe4/dlDbC2F6QhRHM=
X-Received: by 2002:a05:7022:ed07:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1a6ced8e7afmr7393000c88.29.1793284788293;
        Thu, 29 Oct 2026 07:39:48 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.115.216])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75cdd21c3sm15396439c88.4.2026.10.29.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:39:47 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: k@chaosmail.tech
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
	jic23@kernel.org,
	jmorris@namei.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
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
Subject: Re: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
Date: Thu, 29 Oct 2026 10:39:26 -0400
Message-ID: <20261029143926.1246-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
References: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
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

> This should either be dropped from the series, or be hidden behind a
> `melt_my_mac`-style module flag, or switched to a whitelist approach.
> We do not know what keys will be introduced in new smc firmware
> versions, and there are already keys that should not be randomly poked
> at.

1. The patch is required, atleast on intel macs, as without writing GPU and CPU
	states to smc, the system gives PROCHOT signal under small load
	, and heats up a lot.

2. the smc dosent expose keys of nature that can physically damage the system
	it only exposes power/volt data, and the most you can poke is reboot
	keys and gpu/cpu p-states.

3. If a person is randomly touching keys, Its their problem and not ours.

4. There are a lot of things that can mess the system way more and permanently
	than smc (undervolting for example), but they are not safe guarded, why
	should this be then?
