Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822018;
	b=4UpfNNngU+9b7Byi7jBecYbc+kt6lSpflyCT3gm3DXEPx1BYC+o0G/UQMZKgphNg/UOi
	 wfmhUXzz2M9i+zebDqSwDhVsZK3oxMPXsK/5jP0WTf6gqn90hHTR//4nX5in7RNT4tz0Z
	 Tk6VT/i+qN4LeGRUm+/6oi/T3a7INJt+zEo9tkcco995Jh8b984RpM8jgns/PcSgXER8r
	 WTU17mnMX4nGcnhYzha5AM2pTifmltus9pyDSqwtJmX/kob4bJr/2a2QPDgF7Co0VCDYb
	 BzX+qn9iCJy2i0XNc2Fq2DmD3ugELtk9EjRMAuYAY4cLPiUMcGB885TxmnKUFmJ8KDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
	b=JCKP2SsyGfjhCBgFqsN1nlS35VmOmrL5rLBeb3997KU8b5vpBo7wwCj38CwjNNCUG8v/
	 TVtdtFEcJHNPgCGcECvKQwvH0qLlkrRSGaHtfcn8ysGnu7YEBAnVsaac0TxbwmponiyGn
	 VaEBZ07hZxAPgmZkJlwK4fUwtRMpK4Kgc+AUnSCAmH6K3RqffwSBPEylcFUAmnN6d0zNw
	 LjC+ynSWipxtgiG5aN4u8A6SVKQfV7N69lzO1DDeQb9VhrbMO+s0a1bcMFUToZ66WVKaL
	 SMCxJVdbpbs3oRdOfQv5bGpZn4HEcqluDd8AicRTJgEc03Bs03b25Mw2Qgwx8nmre9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PIxcJtgu;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB975606CA12
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 19:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB975606CA12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PIxcJtgu
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so1943064c88.0
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 11:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793822017; x=1794426817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
        b=PIxcJtgujc2omTmmbQjSDoiHGfibpo5iTiDjqZbbLBGHAB5QPvzxnncTOTq5PX1+Yd
         x4vGoaOgDd2rNFGsHvVTl7IgKbIrXQI5iOayHzfdN/6nNULDP9+dM8ILLKhvmO1AP7Xm
         G6lxwhLp0IWaGRXlPWRp+d8DkJwCfOZ/XDlEowJtn6kTEaoR2SROIQx/NPGJmwVBzBCv
         zSql93lPV3VHrUMbwCfTA5fg0pcx3YBTcZ9qGn4n86jok9uEmkaRa8CkMQAePQ3mDPLo
         v2gbGJRm2wdbZOAUiwf2Z/nnqIavSTrUj/yfxtochzqTJDxb8+5HMmw56YYkJfumq0Zv
         eJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822017; x=1794426817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
        b=parsudtnEyBB7c3YZjIlyQfVde8YZI7lPjJ84egGFfa8P7iJ9K7O3buSWqcR9JM++D
         tQSctDMi5vt+j31ejC+BG+yTjNEc7Sg+4GTWMzmw9RS2q73l6MEzbsj1ePscgEipp+Vy
         szcusQ2JXT2RerwQm1QKzgxVwdLWdBFlZXDUDouAoji6KEy2IUeATGg2JfyytsroH6VC
         eQU3nuzoZ1+MbJw3dQzEpt7l7XgUFwJyRU/Wk13apzJ5C69xMjVo+8gEct+zCtKOquKN
         NpNJxC3U5s6SX7nrWdbvp9qD6aBAqzTgArbyzzgtyGPEFZ8FMeIZRYP7EE/jB2mFRvkM
         1scQ==
X-Forwarded-Encrypted: i=1; AKwUvBwo4J/xymmY8jw9kOPASxx1oYVLUS39bBIRcPDp0yvX4xaoV0rUM59w3LlorHfYIjSNneE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9tZ5N8r9tflfKStZy3rJRUgyBx1hHJpkSosxs3HAgTepj4i5Jo
	eM3JRL7My9Oeo5SSwnNEzbfdUa1l9F5cvxFOaPpB0ZoVpuLhegRPMC8=
X-Gm-Gg: AYBFou0A1DEa2Twl0KwOFAYbnAN7SUdZOmpqB88PHnR7DYrS5Tuu5ObONA7nY/JGMjS
	5HIYSoqBVqsIjsmxBUK4KP0KXYDvjT/ByQe8SuEvcH1mGv1owRIcSo/R1MeSVoey+nrzNQE9hqg
	sVbSbMrme8DoMSf37/NpvUkXQL54CbcfXXzI7by4/OB/u4NmQhzQrglWxIRiSM3Wl5PTIv53SFT
	6tU74MV3ilEkyzxnM5fLOFtWsrjtND+AS4nE3LAAEQ6Vqv5+eswpi/GOmTH6UMAxfw49g7MSsz6
	Hlhsy1d0FQ4S9eqYVTmTkteFlcBp8MlksUmYA1PMArTUlTAG2IkRErSDkgjpSJV52BA65SU0kF7
	1rq9vgRQz+FooT5qasjB1WMxS4bAHpj/cUz0tLBAsZR/pW7rA995KbIhmVW5JR6ht86NsXrlWeR
	Hc4CN3BRj+zlqakAnGuJpnR4S5gN5aWCMa5VlO4QPG4ysQ2ru9/b5sPH28020Ly9OH1lyG9iCxk
	7foLkwgAuPa7WJNKZY0zI8kkvGLKhQZ+hbCN2SFftHxl8oxj/n2+GKZRgjm8jJZvfOAbAwflmNR
	XeieV6KpZbssZTxUSFVLdW+TmCEEeE7H7POaYXvt+XbP7OuZH6JZ8PN6ljJOpK/e
X-Received: by 2002:a05:701b:4241:20b0:143:2968:564c with SMTP id a92af1059eb24-1ac5b9cb040mr26455364c88.26.1793822016817;
        Wed, 04 Nov 2026 11:53:36 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.194.66.249])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2d69asm9239684c88.11.2026.11.04.11.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:53:36 -0800 (PST)
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
Subject: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
Date: Wed,  4 Nov 2026 14:53:17 -0500
Message-ID: <20261104195317.8284-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101013817.22d67ea7@jic23-hlaptop>
References: <20261101013817.22d67ea7@jic23-hlaptop>
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

> If this isn't matching some legacy interface, then we need more
> on what these do.  Maybe they are suited to some other kernel
> interface? In particular they might need the various controls
> on how destructive they are that something like fwctl brings.
> 
> Generally an arbitrary opaque path to firmware isn't a good idea...
> 
> Jonathan

Here its required, if we write CPU/GPU Pstates and PPT to
some keys (MSTS MSPC HE0N), we can reduce the temp by 10C
And We can fix the dreaded PROCHOT signals on macs, Giving
Same temps as macOS.

But you and Sasha are right, that exposing all keys is a
bad idea, so i have restricted writing to some keys only.
