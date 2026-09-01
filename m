Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539D342AF9A;
	Tue,  1 Sep 2026 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276965; cv=none; b=WSdbIK2qv9barE+H6yEF9uh9jQGN7y6DLTehUa59Mtjgpic+kEc8SEA3fpFzeB9YEIQZmbj16sHnVdGtMhElxtin9mK7tXsPlcPDLAvzUF8qSI/AZskPHIGrFW4gciCAc6aD3w2dwZd5nhdJOzvijFQRNsHFBQiLVQCVDedKNv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276965; c=relaxed/simple;
	bh=FvNfgYX9wvzFhLGncRRS076q3d0iS4BWfTrVbSmUXIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eRoteplbrJbOL52aEKM7srN++EtSoyJtuepQZj6kWzMWnF7V8X3etxJzIVoku3hZHQy7JkRhZiLSjD1WXRqBfJth2dgDDRUX0gSKoz9GGOgwzfsAJ6ApiUm1B3wIBwDK6ikeWq5oodRNKa8BBnz7QFKiszEXHRpW54NNZH2WOXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hq5oE9hr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hq5oE9hr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A23F1F000E9;
	Tue,  1 Sep 2026 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276963;
	bh=FvNfgYX9wvzFhLGncRRS076q3d0iS4BWfTrVbSmUXIc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hq5oE9hrA1XodAB/oBVXMcKjl9cq6hMf3f+JeptEKwCTYhP2m9zi1S9bZfZeLkWrR
	 hoqhKh3w2sSjFPAGlolsdrcSTqOJGAz8VQEP2qWvJwP08RVLVJAlZwm9fJvbwxIplf
	 os7oyt9ewT0UNmb6ejH9/L2QK1pGhvAknfeUJ8Y+cqXusxnZosttek3J4GwD1tpWT6
	 6FyRWa702CXka24aO5FF1VK+BiZ8AUFLp8JuFUxJSC4FoU2MH9AT+SzlXcAknNctT2
	 vkIrN/HdJT035yvQhIoEUNf2ASETqtWY0KPk+wRNH4kXY07Yu21km5LEw0beSOOJaP
	 lH4yMIExMMOlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/6] mfd: khadas-mcu: Use MFD_CELL_* macros for cell
 declarations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, linux-amlogic@lists.infradead.org, mfd@lists.linux.dev, neil.armstrong@linaro.org, robh@kernel.org
In-Reply-To: <20260901-add-mcu-fan-khadas-vim4-v10-2-aecdb9955a30@aliel.fr>
References: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
 <20260901-add-mcu-fan-khadas-vim4-v10-2-aecdb9955a30@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 15:36:02 +0000
Message-Id: <20260901153603.6A23F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>=20
> Convert khadas_mcu_fan_cells[] and khadas_mcu_cells[] to use the
> MFD_CELL_NAME() helper macro instead of open-coding the struct
> mfd_cell initialisers. While at it, make both arrays const since
> they are never modified after initialisation.
>=20
> This is a pure cleanup with no functional change, done in
> preparation for a subsequent patch which will need to attach
> platform_data to the fan cell.
>=20
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-add-mcu-fa=
n-khadas-vim4-v10-0-aecdb9955a30@aliel.fr?part=3D2

