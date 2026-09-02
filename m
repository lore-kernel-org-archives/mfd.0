Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C1B495041;
	Wed,  2 Sep 2026 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353940; cv=none; b=UmUL03MzMfyhoIPJprsINz/sU/3FwCOyVoyfbZBG89ONpQ/hphNvKSeVrTZ1vaCtY3GGedqbf3ZQUuTSGT0v3Mwza4tYu63f+W8sA8okOq06jqXVJ9r0VNbQAuM+IJFIBxB/K9cFWvcdFoWIJDVVdxM7XLeUkyrFK42jBPgKyBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353940; c=relaxed/simple;
	bh=bE69FJQTzPLfXxv55ESIfZ0SRnSNE0EolT5V9XasIs0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vDwWN9VT0E0HW4Jb5soVl+K2zCKTYjw2fZ79SiTf0UMeHneKnfeB6JoGQZjZeM02qP7Aj9FOTignq68jvb8xZHxfJ53ARV9Tj5rs8aUm6gCbzCDMqkNkEUA1MKi4zP7g3BXLYaoIGDMESCzDVyuHEqHQ/+iId9mD3lmDOporcUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJAjhQQX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJAjhQQX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B581F000E9;
	Wed,  2 Sep 2026 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788353938;
	bh=bE69FJQTzPLfXxv55ESIfZ0SRnSNE0EolT5V9XasIs0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CJAjhQQX5ZrhrgMT1QJ/vEVLzUqd2a1ZbZhoU7wSlYMvbNrw2CBhXA9Ipi09b3Jd4
	 S1DCyrX26cugkaZlgXq0o2pcObur2BSfm2RlWACR+szk+aCGFl0T++wRXXLui1S18g
	 J5U45opVhBeZKW0XSa5OrNjCBHhxDv2ObggctoccRkJmXCZ4a2KB+L056pQ0lbuoH/
	 xqmhsrYCmeOq5s95RCkTSeyaJlkQjOYLW1Ydg12RswYagyihvuzWWllI6kcLQeJ+C4
	 6UaFEKnsi2KSpfR+HgibFr0K9a0rJluW58PYOnd8sI6EBdavYgKZoU+OMq2LXqDTPE
	 Q932keCwOFa/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/6] mfd: khadas-mcu: Use MFD_CELL_* macros for cell
 declarations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, lee@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-2-5f1610d83bf0@aliel.fr>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-2-5f1610d83bf0@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 12:58:57 +0000
Message-Id: <20260902125858.79B581F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-add-mcu-fa=
n-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr?part=3D2

