Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8B5279DAF;
	Sat, 11 Jul 2026 06:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783750779; cv=none; b=pLCwonWDYHeQcDooxHpM7QCNZ1JQVsDCvc5cYSeiBNkS6IzrkpftsT2yrzmFUh0DVZZosX93lSAPaWGnXGz+lvZRZHJDDeKjXdBgYIF1rgpMxgDRQKY2uWwwggg2uq+qWu9hLo+aEeH27BsUWg0Lvm7au4T9CCzrw4GuIR7fmOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783750779; c=relaxed/simple;
	bh=l0grfuKIsTMvbS8uTCzoVrty33M9dgrc7k+SKyobfJE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WDF0B8RvY153k3dZCRRxMMwTofHJO0gB+LMnqpP2RhbT6t5so7gmzLYVi1ItajMwBlJEXgUoPGWDzIPcQNDzryCTbjxFGkcmeyia550G6asMwNDEC2rTrA+eevbn5JKtnUFNwvR4CO/UkxLpbYglbKkFVh6I/JfDqRPtZv91Yio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbniBfay; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbniBfay"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C091F000E9;
	Sat, 11 Jul 2026 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783750778;
	bh=l0grfuKIsTMvbS8uTCzoVrty33M9dgrc7k+SKyobfJE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WbniBfaycZ/AgZ2+lEqbtChQz2/kTlypNABFrAgczNZFc/Tj/926phBLVRhzf6uXy
	 IChZMsZRIBJQN5InQIMjW8Nsg50f2nmOxKNpAE1zS0LeAq+IxRsR7Q9kORNjdHnJWH
	 NZUxBEyw+fgg/ApEimIfbhC3i5c3R6u+l2OHhFtfYHYZIdJtBPSNA4/j9BZYiMB1Wj
	 lhB/LpmJcLw0gFdfApwNUfygooL1HfD3j+lU58ZoR+Zm3FvjoOJRhCr7UOeFPh04Ov
	 LZJkywt2Fd3X9TDi6rmTFsUAPUYDd0+piRoBdFLfqN/1SFDGsUuNIKwR422DBFS+AW
	 kh65xP96ZfnGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/16] arm: dts: omap3pandora: Populate DT data for the
 TWL4030's REGEN regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: lee@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <d0b2a73c7c208f33784eae4219ff3981800ae6f9.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <d0b2a73c7c208f33784eae4219ff3981800ae6f9.1783749722.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 06:19:37 +0000
Message-Id: <20260711061937.E4C091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Grond <grond66@riseup.net>
>=20
> On the Pandora, REGEN is used to enable TPS61029DRC external regulator
> which runs a 5V power rail. The 5ms startup delay is taken from Pandora's
> 3.2 kernel, where it is labeled as a "guess". So it may be possible to
> activate the regulator faster.
>=20
> On Pandora CC units, this regulator is used as the input to the LCD power
> supply. Therefore, problems are likely to arise if the regulator is ever
> disabled, so we add the regulator-always-on property to compensate.
>=20
> Signed-off-by: Grond <grond66@riseup.net>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783749722.gi=
t.hns@goldelico.com?part=3D4

