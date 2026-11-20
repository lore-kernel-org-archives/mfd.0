Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138030;
	b=WhbuaFfFjo7nx4bGg1TCpMkez0u6wvgdtQXp0L93rnX4RQVXJn92o4OnSALq0QuG4GNz
	 p6H8lWP+AyJaVBD0360XSn5Ry847vNVq0FJmrP9haBarqphSJf5Wc9IrKYzUAz2vWgnIm
	 4xmau1k5/GVCsG3MY5fxdks+GkO5NdNF82FbjSnPzhUOENIqWqFlySJ7p8xuHTcx8fTY5
	 m5YeWSW+qyiXW5LVVL9vf1V1TI+qfV5QVUjn+W+uVJYB1QytzD7K2clKsC/Wfsj+N/WYD
	 d1DOlQmdD/zK5GXWPiIEgtu7JNE3KIjAs8MvCjfYVmGBEaA82d9rp3fU6ASEqudglpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=;
	b=Lt2ZZnZfpM3KK9fexxsu/5IOtWXMwT6SgkP1s8Fax9a4YdyfkgOUbMTgYAJZNUfKcl5S
	 kzcks0NryQC4e+dafNh/6jDlHqpNpp1n8U+nmGdwD2/CJSlhtedoBp9qaLB6k43lR6AlT
	 s+WnGHaBwOrDBb+dnBUof+yj+70jQgFSR4PLhPojvBsUReTKSstUfahmmhmOKMu0DjfOM
	 PG7ywwsNtk9kk5uzd9dCLuRIXQ9YEbxrDLd0TiOIo+0TyH06b36vWmloYD6zcw+ToiLqc
	 6SS2FkE4t2TW/tE1ZWYeEwEkqcyywCNBqgovT2cFS83qyF9TfYFeK/0V8nRozf8ntsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tFm9miIB;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19408606A330
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 01:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19408606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tFm9miIB
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso177404a12.3
        for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 17:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795138029; x=1795742829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=;
        b=tFm9miIBoM8CpJHwPrrkY37DhO+F+qgd33NWiDa82BBInpthD3wkD9779uMNtM9lac
         fvaTnq3agF7gVmvKTrsSK7imZiEbRhMt7pC0ByKO91qIHneR5hHFeQVHsBXyFmqR31lM
         STHEBeZGoMj2SFUVFUi7gCRUIs5cDa0wSLDQEWnd9HCDckVXtCw7bgfib53Szvme8ZeN
         h2KTKJvoS0zzAEXk30r9dWxx+yY5pzjx1K+0KOLI+D5eKWcnFDFfrYCeDhGBcLHoZjTQ
         7ILv6oZxuo7GaJyY2RxNntLeH4XXMNidwPUJCSAqHhYkMzm+dYHCXGoXQx05jPboDcQd
         Rekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138029; x=1795742829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=;
        b=CkmAfbM+po/PEoRZkwcfEWlCjeDNjFheg0FVzUDbeD1tdyzOcuqTPojIpoUAsyOhpK
         Ab7YNknbKfHpd4uAVAIIUABXGbOkOQgGnBEJXnxuIk9K451coB5Cc4zIgfe5sTRqWtMH
         FPm1Cap/QIJQ0JO6bJd/lJGS8hWPn8y8rPCb0ZJfIztQKVaE2WUrLx9660g3+iakcTzu
         IXXBGC8LcMeGpkOekoumxW7BCCPlvrjkR9n7y55d4f47DWVhP5Y39Exzi1zDUo8VROMF
         aNa4XWSb4REF2Bm38+pbcLKGLLVC162Es9ko1TrkFFUc5qfpgnnYJBpbdU5lWAQMG05+
         yTUw==
X-Forwarded-Encrypted: i=1; AL+hErEIqbMTp9vpyJkQHpa6z/SR7Hbr3inXYuY9ZIH3HBSRcskNFxEWQjEnRiH3W+VcaRxbg/s=@lists.linux.dev
X-Gm-Message-State: APuU4Z92zG+uwReajAPpgiVybgKOR5krSFphFqaPvq9dzMrW8p+m0ZEU
	YRpw1jxCZCLbFkrMsRcL8C3D2twkzsM40An3Rxb+n5hHw0dw6CZOqH/9aP7q77O7Eg==
X-Gm-Gg: AZFdTZeY6w0tAfBJO+Tl5IGC3zXmeMV+KrJU0Lls2Te07BufTpRw+IWS5uGE2tkjHWD
	I/h9GJsmGUu9D1BtdDkM+a+140bYqBufz0i8koWYgP17caBl/DTTldxCj5pPderLqOxBowFTYHx
	zSVHnyENTbiG+viFFugkS7oyOv6maUie5NAIqlV1nC+6WC0u4FaAz6fPbAUQMwK8G9N/1SGK1gU
	HjCzZHpV10VrlmtJ+QE6jfasV11MihWt136p7Dm/AnpvpvKvx02aMFSFHqbR+Z1JkWyEN5MDqBw
	+NYBXJbkq5DT/uFXNcXgeTadqN0NtIpR4HyyX/ME8j5tSDZhsYHzTRI1EhfQa6fRbfEUBxMStHb
	BYZr2x73m6U8baCkfGzsJYhh4/lfJnY9KZ7kWlwYPSyU4964Vh0rij4a6kyeKkT9bQs0jt4Y5RN
	mW8DUIFCE2GQHzocn1tch9jaRjBdYquUtGXpDK5lzNbJdhf9xPhLRNI++0X/sVodlKxeNQytaKo
	uG4T+jYjCelwT7659nIQxhLXOB0pALnjyKLpx9H7ZnQirKsHwe0+7AzS2AQ4k813l1d5Y+aVIeh
	e5KlTYjDX9ldGVwuHddQk/NWtMz2SHfGXkRlUhWII6ot4jxiRDNrkXOGNc57/MqNNXpQbkU2Cf5
	wy1+2di2c/D6eX21K
X-Received: by 2002:a17:90b:4c0b:b0:3b4:12a9:2e1 with SMTP id 98e67ed59e1d1-3b41c931d36mr1334543a91.33.1795138029298;
        Thu, 19 Nov 2026 17:27:09 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm1763326a91.4.2026.11.19.17.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:27:08 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Rob Herring <robh@kernel.org>
Cc: netdev-bot+sashiko@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
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
Date: Fri, 20 Nov 2026 08:27:00 +0700
Message-ID: <20261120012700.1878745-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119230614.GA1147583-robh@kernel.org>
References: <fd826c118aec02c06bde92ff9c20f1958c214b3d.1794284248.git.jjc@jclark.com> <179446830443.2199510.10552580927894870264@kernel.org> <20261117004133.1594972-1-jjc@jclark.com> <20261119230614.GA1147583-robh@kernel.org>
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

Hi Rob,

Thanks for the review.

On Thu, Nov 19, 2026 at 05:06:14PM -0600, Rob Herring wrote:
> > There is no other user in the tree currently. If in the future something
> > else in the kernel wants to use it, then the solution would be a small
> > driver to mediate this.
>
> Would doing this imply a DT change? If so, your binding is not future
> proof.

I don't think a driver would need a DT change. The property only says
which CPTS input the GTC push event is routed to. It does not say which
bit the GTC exports. The role of the driver would be to mediate the
choice of bit in the GTC_CFG0_PUSHEVT register. The driver would bind
to the ti,am654-gtc node. It would not need a regmap of its own, since
the register is ordinary MMIO, so the node can stay a syscon. The CPTS
driver would use the same phandle to find that driver and ask for the
bit, instead of writing the register itself.

> Not the kernel's job to validate the DT. If something in DT is optional,
> then whether it is missing or wrong doesn't really matter.
[ ... ]
> Is that true for *every* kernel version? Again, better user experience
> IMO to just warn if something is missing and continue on enabling
> whatever you can.

On reflection, I agree. For v2, if the ti,gtc-push lookup fails, I will
make the driver warn and continue without enabling
PTP_SYS_OFFSET_PRECISE.

James
