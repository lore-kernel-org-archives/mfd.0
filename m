Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6BB51DDFC
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699260; cv=none; b=sYjXH0AYFwHN232caBrOb8yFJO9nZ3Lh2s8MzKvST7zHCwp/baELPaj7PbXxzPpX4W8G/SjKtuwue0QTUaTZw+AmBETkpiM6iBno2SpMBGATdo93D0SbUR9P2tUqT7bFqmRg5KTAja8ILEqeTA0xpRLAHeB3XGlGTawidYcxeH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699260; c=relaxed/simple;
	bh=PMX1p5KQ1LljzZN0fjjRX/ggRrs5b9HbaoJ5+VgHJlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBRB26g18eTPgxhekuHDtPNB2mxBEEUCnyek/yR0Beo7hQtpGsDatSyo5wLyRU2nfqVILqs6k91KeqjjglaL6d+cLqPqMxXac0GLPJPQfS/IpFczRZ8Zr9FT4EXfdsVygXNlbbViOxrm7airq9GFXVWESgPO43GNnOL+HSCrjOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o79O4+GM; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o79O4+GM"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso862758a91.3
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699258; x=1791304058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMX1p5KQ1LljzZN0fjjRX/ggRrs5b9HbaoJ5+VgHJlw=;
        b=o79O4+GMoItIhdzptLylNyr8hWei8uLI9QDad0X14DTMw/OPc3LbVJ8/k9piXr2lN3
         15pUvZSFzUHurxaEcN7H39InNAxm1H/ybftMkzrp19APGu5tokWfQn+zZDxfqLa3RD5f
         mb876p/vcqNHFg0fameabJp0DiFdB0Ad3+fnO6EWo1uhdJnAaB/NRGMOenE476fr/w6T
         joPmoc/vvWFYkvUWXIdiQQzT6hMtTlfsSYgHRV4NK9HEU+7omL4bVuLA2FH033IWCiES
         u7L8XcoVDFTecJl1MdyBplKRpaVVzkxsH+6FvqyPFDRkmLZel1qSZmD3+bjV7mrXDklQ
         +9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699258; x=1791304058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMX1p5KQ1LljzZN0fjjRX/ggRrs5b9HbaoJ5+VgHJlw=;
        b=HSnhlcQrJGb8/CfcbrW01habSQ9rJ6ciamhvY7ebLDaXb7FqGPBplgBDCeYL50cxTD
         1b/Y2OvEvZYK5k+W4H2q+bekN9hw0jW9PwfcA59/JZ8vE/w4CdHfATk28KNQ+Q+8VQy1
         +I3d+OYGl9N6s7OGKlj1MDrQdBJD7BUR+kgs+w5jwthNFbRI1E5zx/ZHUDXpDrIE98Zo
         EvkiOE+ztk7xvzPl+XLvpyWqhN7xJYRRD2WuxmXPNQZpWCv8MudU4NKzldxVQZT89xQz
         l83beHiUHx1lEdnquzSFDgBH5fSSbRBsqqOBQOrk8lc3EE09g9e/b88a7nC50uEChugC
         Wfmw==
X-Forwarded-Encrypted: i=1; AKwUvBytq3ANyatjiCz3+qyw+wl68BbI1zJHEozO4k64IwnhB8/i7W0XEL6gvuaHe18wNvavvG4=@lists.linux.dev
X-Gm-Message-State: AFq9FYLAwxKgH9IG8aDVQ5uiJraxeHBxi2Gqb6fMgYf/rMA5reHrtg6e
	xe4K3TAUl4nM72F+OwQ8d8fjwiVorHJGPf/o9r/6nrn0g9RSPj5l5/aE
X-Gm-Gg: AYBFou0hGEexunD6RnRWDM/ZUvAkrwE4yeaic588gYAQ17d/EMZh5dyRSACAyOg21Hb
	atCoOOlOgAmz58t0NUv5i2Q/ZTRgNJ+4EWdfW83pbgyn8wPvD2TxO7QzUBzy8w2b+Lzar4yQTiU
	x0hAfD42ZHDyGGNKv/ETpgyC+yeoMf5gIsHomP5wzGLSUq8SzxNnEFPpDUi6LEh6YZ8JhX4lWbu
	Q4l0ogfuCESt0ARFa5G7UhVBYefRA/4FduEnXhOwNgx0JMFvk+5UZcp+XO7enlAoW02QgFPGhc4
	4NtdPhbGnzL26uqSu/RMS1+KqVgMBMApSorZvNkbKFVZXP/WHXLSQiM4fdQrZPu+CZ2/tBGhNpd
	8fX4/hrJ72rWZURaZFjSZS310a02ZnsGFA0biddF3jFO2cgaKZ60lwj5zwoHrqmlrNGJya3lfr1
	xWFnLZls1+ec1KnqDVmrYU2OMV+Ep4Y4CLyDmk9GDqFUWuQdcDQJhonrrSdWzdPVFGM6LMqtbSd
	LKjpnpVbkw=
X-Received: by 2002:a17:90b:524a:b0:3a4:71b7:eb63 with SMTP id 98e67ed59e1d1-3a471b7f585mr3801721a91.10.1790699257948;
        Tue, 29 Sep 2026 09:27:37 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497f23328sm6510887a91.10.2026.09.29.09.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:27:37 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: Re: [RFC PATCH v3 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Wed, 30 Sep 2026 00:27:24 +0800
Message-ID: <20260929162724.1545-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260929141337.6F0321F000FF@smtp.kernel.org>
References: <20260929140649.55-1-yaozhonguwl@gmail.com> <20260929140649.55-4-yaozhonguwl@gmail.com> <20260929141337.6F0321F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2026-09-29 14:13 UTC, sashiko-bot@kernel.org wrote:
> By delegating this core power-off requirement to the optional
> pwm-backlight driver, could the board reboot instead of powering off
> if the backlight driver is inactive?

I plan to keep the GPIO1_D0-only description in v4, and to make the
commit message say what the backlight does and does not guarantee.

On the emergency case: the PMIC's power-off prepare handler runs from
kernel_power_off(), after device_shutdown(). orderly_poweroff() and
the forced hardware-protection path both go through kernel_power_off().
emergency_restart() does skip device_shutdown(), but it restarts and
never runs this handler.

With pwm-backlight bound, it sets GPIO1_B5 low when it powers the
backlight off, and its shutdown callback attempts that from
device_shutdown(); the result of that GPIO write is not checked. On
this board, with the backlight on at full brightness beforehand, the
GPIO1_D0-only setup stayed off in 3 of 3 runs. GPIO1_B5 itself was
not sampled at the PMIC handler in those runs.

With pwm-backlight not bound, it does not claim GPIO1_B5. The pin was
an input reading low on this board, and that setup also stayed off in
3 of 3 runs. That is an observation on one board, not something the
kernel guarantees. In particular, if a bootloader left GPIO1_B5 high
and pwm-backlight failed to probe before setting the pin, it could
remain high. I have not tested that case.

The alternative, listing GPIO1_B5 in power-hold-gpios, means removing
the backlight's enable-gpios, and I have no schematic showing that
property is wrong. That is open question 4 in the cover letter.

Thanks,
Yaozhong
