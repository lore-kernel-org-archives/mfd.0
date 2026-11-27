Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753343;
	b=ZKHSPXKPCUbdJ2xKcRaeUOQxDo7eFEysC0xBybPiMLD9mRkmbozWouXazzd5db2n8wWD
	 0ckwO7aAz1Yd0TFTfgHVOGdZ3kBpV9kUKGVFHOJkwCA5FsWvcD6Ecx0tkvUDvbwFLt/Bg
	 7vpjxFK11RArHIIsOreNb4gSLZN7eLi9k1TGeM3x322HZtzaQbvzryVnVg5qvQgkMR1YT
	 2Z+BarGfUTlLvG+lwOzpa9u3wXs1k0foE1/hliZJM9GlM8vEBp/F/WiMhP9scSFi/ovEs
	 5sx/bVqieKfnm9HfdsmeIZAEpsgZ9m1E5e/o7w0neeTvgwJ4PPX9us718fUiY9PmhMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753343;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0jbf6wH37ABTltoTevFDHgr52Tx8SJam0H4PI8m3Jwg=;
	b=AFfGcniDHzTemrtKeMMII5gZgrIzz63+hEhdaBP1a2VWoBUx/F1EdW5KRx7yXN877mQA
	 ACvtKDiXkw2hfEuM1rLEhz/qI9IFvDpm7Mk2TuCfzUwizWHzxp7xuNdywFZBM97o3nQQh
	 Qzt7hTTHa0frySOTsudm0+H5UarZdh85IpnKxUKVtPi4r2pNiPtmpdYyn6X5xAyxDEwuW
	 iQGT/b3QYifp1f0E/jhyJB3niM0q2x7xwgC/89rE4bPo7jb1fpA1KwG9VxRRx6IpnUWHb
	 6xUn5sx6nDLEdA9pK1I+/BnG1ArLgcoNyMon04qFmiFYlFVUsnopZzuPrgn8D4Yt9tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CZRnxoKg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D96606A31C
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 04:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CZRnxoKg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6F11F00897;
	Fri, 27 Nov 2026 04:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795753343;
	bh=0jbf6wH37ABTltoTevFDHgr52Tx8SJam0H4PI8m3Jwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CZRnxoKgQBnJi3eMbeeyEwIv47oUOZAjXwMtWdfLWOG1kI5X9QHkr527s4J8uzFqD
	 7u31xDJHo8Lzob25E4peQSqxR0WoJJfsqo1fPyB/yrQrYDdFXGaXrznjGys+gc8Diu
	 sJE8Q3Hf6BsAbhKYFNXJ+VY/lojB0f9WuPhX4SF+FYcvFQoGEbZhCGAPJTXRMOCgOB
	 TBSEB+6juG0Pn0/xQHfSieaLSFm5HK774GyB5NFxHYJRix7VusypvnkmOCnSG5r03Z
	 0pq1WVT7O9ldWsOWSOnFgqaBpLbkc7Nfir1kdQOF40IE3PbyfwZyUg9kpaPJLIywHB
	 TG0ymxzGR353A==
Message-ID: <sashiko-outbox-236591@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/3] mfd: Fix an out-of-bounds IRQ map and error-path
 bugs
Reply-To: sashiko-reviews@lists.linux.dev
To: shao.mingyin@zte.com.cn, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261127121734430rp7P_HaHukJyZYs7OMQjx@zte.com.cn>
References: <20261127121734430rp7P_HaHukJyZYs7OMQjx@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 04:22:22 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127121734430rp=
7P_HaHukJyZYs7OMQjx@zte.com.cn
