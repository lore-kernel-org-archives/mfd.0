Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512350;
	b=WtHRkU1yerbAOA2JuiD4xdWMfK42BWSfryqpOHnS1qSQsZ/dQ88Cd9RdlE5fmIw5hlSK
	 D1fZKEr9gL/FscxfUoYH5vcne8MkLw+NNbCPz73bO1tO8xzI6dikazt2wCcg8v0zRSb3h
	 bRKW4H45NUEnCLqjknASTBnX9JyAd4xs8WqzQR5vh5zFKvXpmvsD4YbMfcizTgSYR06jq
	 rnI/mEDRy2YQPCMhks9D6vGCFmOnzCOh5ua6evQFHlu1hfAZsteC7UWzPwYQAtDg2Sw3m
	 l45/Z2cE0Q84p/NxZGUCYoUt7MSsoZtTIfPDnQ9AGSLYp974j5hL4Vb2IoLGXsNyt5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512350;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pZKbjaRLvgDUxKJtigY16xxH4Bbyh4nTfTPrJZuvP6A=;
	b=UC5qC185VmHgiTrntTMoV6hINr+9/qaywdjSBAYguFpVzBvd2m3fjcltKvA9CoLMe4Ur
	 48msV8c6052zd1I5wTME3EZDBuDP0DETMxSlhxBi/D76l2/EwzhT5j65CUZ4KSd1qmsjq
	 Z8ENXBnhVuYEAHwQfstlgvNWBxNrlx+6zamtHSyroZbl2fLHuvSnogGZlBwGbUQkMxeja
	 1MgsBCtLgh3HCUwPGeSTvwIzay6bp4h1GUju1bkKlfj+dAlpr8SH5p1KROSRsYuuT9vTu
	 I4+oZQef3qdIKY+DMtHrkalW/DLveMXA+WHmqEqQ/sxXItwplvTbcEKNFK8q17W/4+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D/jGSNr+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736C9606A683
	for <mfd@lists.linux.dev>; Tue, 24 Nov 2026 09:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/jGSNr+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9A11F000C0;
	Tue, 24 Nov 2026 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795512349;
	bh=pZKbjaRLvgDUxKJtigY16xxH4Bbyh4nTfTPrJZuvP6A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D/jGSNr+xzG8COfvVhyxg0QeIBd7FlGE3OKNiU5P2+GbMIB+0Vph6kdBrTDIvEzkg
	 qTvWE2vlhDIz/XdH6DOHB+9Ce4lw3JbLoavCgsh/dOvG4b4oTH0SUqDRpYVMM4gBnX
	 A4IhPYQVNJrptR6T2QQTqdZU/uDMmMVtYaz+1Ul5p52EYX5mYOaIenpBHQcwqlhTM/
	 oTttklGtu+AqWGLbwL8dRtSXmSCy6jCJaBB7xnx9TCEFSQeAHu96/gpxisUagVSQ0e
	 7s7SQvtwIx95A0YSAotyC7v7PvCIa0fYasKOJ3Qu+MZTvUzhM19vSVHRZ4m+0/yBJw
	 3ZSVlK7DJHriA==
Message-ID: <sashiko-outbox-230831@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: cgbc-core: Add support for conga-PA7
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Haberlander" <markus.haberlander@rosenberger.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261124-cgbc-conga-pa7-v2-1-18a114b1801c@rosenberger.com>
References: <20261124-cgbc-conga-pa7-v2-1-18a114b1801c@rosenberger.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 09:25:49 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Markus Haberlander <markus.haberlander@rosenberger.com>
>=20
> The conga-PA7 is a Pico-ITX board with an Intel Elkhart Lake SoC, like
> the conga-SA7 SMARC module. Its board controller is of the same
> generation and is accessed through the same I/O ports, so the existing
> driver works with it once the board is matched.
>=20
> Match the board vendor and name.
>=20
> Tested on a conga-PA7 (board revision A.2, BIOS PA70R026): the core
> driver loads through its DMI alias and adds its GPIO, I2C and hwmon
> cells.
>=20
> The patch and this changelog were drafted with the help of Claude
> Opus 5.5 and reviewed and tested by me.
>=20
> Cc: stable@vger.kernel.org # 6.13.x
> Signed-off-by: Markus Haberlander <markus.haberlander@rosenberger.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-cgbc-conga=
-pa7-v2-1-18a114b1801c@rosenberger.com?part=3D1
