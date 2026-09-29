Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C1D35C19B;
	Tue, 29 Sep 2026 19:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711553; cv=none; b=tgofqiOcvdC14HUmhzwaFsEmxdUgxjQZDYII/cXyz0pOkyb3rK610xA5rUEQ/vjNLn/rHg7lJOPP9dL2OEE9qLcjgLfwYBiCPORPpzDR0RQa62RhctcC4qlR+wkMwRfEfSc6HW7n96h4eaHYhEPmV6vahqUxyQx+cvqqSbS867k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711553; c=relaxed/simple;
	bh=Lsh5zRsIbw2wo6BPUdjmkRhroTBJu3Cktwqcw9cw21Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hftvqWGz0VU1mVXhy4pw/FY16Pw27kSPHzij+SOtV5D9prtxMUREAhN/CD/p1Y8hWmwqnCX/f+B6g8HY6QLoxILKtm/aWQDycav+5IXXQRVhGYwWwd10Ain7AjC2EeR5cOaTtprtCgmqZfiEZ43supJK8zpqEeyOEWT2fg7TFTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hiBCPP/F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hiBCPP/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AC11F00898;
	Tue, 29 Sep 2026 19:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711551;
	bh=Lsh5zRsIbw2wo6BPUdjmkRhroTBJu3Cktwqcw9cw21Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hiBCPP/ForurW982nlbe2TzhnbTQCZ/wy250mykqLw4yYmWBnnA6xCO3WvpyVtliz
	 B9tzy/yCUpymapE9YNaquU9Glzy9vtLqD89o6Iw2quXRuMG0K1pecAx9s0GL91rnPk
	 Tt3442zgM/2fkwKfoIgv3iW1qwvSPRv+Y6EhDI9/x+6i44BUagGZlCTaeW7b+ua7iT
	 SzXH4+ZKGgnuvy15wcs0x2/1U55Qwu10sMNy4qgKRCZwvzFo245PS8D2cyODxJMaAu
	 bC/saijEOZJWsWZc3wUJypn1BnwkYF28pg+GdwNdaqEyfF8t2kCENmkK1lipeNq+Pd
	 I3KJ7AkAzyPQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v24 03/10] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928194511.41878-4-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
 <20260928194511.41878-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 19:52:30 +0000
Message-Id: <20260929195231.43AC11F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
>=20
> It does also support i2c and timers but those are not currently
> supported/used.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928194511.4187=
8-1-ansuelsmth@gmail.com?part=3D3

