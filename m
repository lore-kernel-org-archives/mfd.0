Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008769;
	b=nEMGlwudhBSvACIGyM6MvNxrza0iIIEDZyOF4YEoH0SWDX/pS4p/Z/qXracUsyZXA0AJ
	 pOTLBUQuZwQz/wrg9x5qjHEYErec3hdrskku7MIq8I6t/T1a5mJq6yElBySTx+sbHK7Xf
	 +WREvdOpMgLtwoV84Rd7N4K00vJw3R0dlOMuvflgEeYh7+IRPvW3pp5QCVpOY0Wt52R7B
	 wlxDLwsZMiaRJ5jArmuI9wON0hCw7IGx1Jo0DZnQxcnxYPUHc+zL+4LjsajHa4EX2lGVc
	 Relu6D8w2RoUMH/5r8WAc6Ih3VbNTBwRChcKYDAuOdljg4L3K2QKnmN7oaMfqq6gKaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008769;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=l5tAGq8LD7eVBOOXSoD/xxeDVRpU4Z2nV27f2hUsMlc=;
	b=RUGmi9MXPpphcCoG1y7O8ww08H+8gEfKzQFnvY44NFN6DnW5ta6stDRocbwLHW1nP3QA
	 /8zkJfRZRyLwPlOtk6HTX+2s5s6S/pgjEdPhLQDdurzqbjrUv6CQKJozdyizgCbZIx26N
	 Rm8xP9nBMaSIe1HdgkuzGCXLrG2Lym16hH3uoTINKc4u00Fee7NpFYKOw2oUsGdWNGt6O
	 6cQQzZzrMvYSL9IfJkbmvwwH6yUvgXCX0mGU6r+iKzDhQb5R30aL1FGUXNN9RXnVviR20
	 PCMb++OAxpLUsdGDsEnHqwlbdcUMMwTtzJ+3FB/5WVmuf/c1B+ba04Wgvg6Bdzyw3ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gxJjnJ8Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC91E606A325;
	Wed, 18 Nov 2026 13:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gxJjnJ8Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093C01F000CA;
	Wed, 18 Nov 2026 13:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795008769;
	bh=l5tAGq8LD7eVBOOXSoD/xxeDVRpU4Z2nV27f2hUsMlc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gxJjnJ8ZwmO8//pFZEj0DSAK7Z2FQ57UCSovJ4wRE3I5pzbIKemAt9EPPQIA4Aktk
	 cWLH02uD3iX108C2NMelvIsEipdkqLYm7BIHColMQMQGXzZ5wOOBPBmNmT1ZYxBGwy
	 KTaN7/4qzSHKmUt6fhUQPoRzVjsgzbMKZ5Do97tzjvPjM6ecdtZoqcXEERoNWO6X1O
	 z4+4wEUNHG5uFgyTrA6Ez11e5FoTdRjiob+e6FNusCiJzUmMcz5PwcuJNAORORGcjm
	 XPCueNvH7/JiDk6lPL0QgjWqXILcuxrpHhWQ5ORzQwCT0niVKaq3IQ6ndzPmTXiAYf
	 RCDs23TNdbLjA==
From: Lee Jones <lee@kernel.org>
To: linux-mediatek@lists.infradead.org, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261105104837.1105227-1-l.scorcia@gmail.com>
References: <20261105104837.1105227-1-l.scorcia@gmail.com>
Subject: Re: (subset) [PATCH] mfd: mt6397: Use MFD_CELL_* to describe
 sub-devices
Message-Id: <179500876778.21786.2112559503072927273.b4-ty@b4>
Date: Wed, 18 Nov 2026 13:32:47 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 05 Nov 2026 11:31:05 +0100, Luca Leonardo Scorcia wrote:
> Use the MFD_CELL_* macros to describe sub-devices. No functional changes.

Applied, thanks!

[1/1] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
      commit: bf7869959b3439b60741a4cd3e6fec59123b3c0d

--
Lee Jones [李琼斯]

