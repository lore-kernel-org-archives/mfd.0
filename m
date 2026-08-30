Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C117F30D405;
	Sun, 30 Aug 2026 22:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130265; cv=none; b=RI9wKHDUh8sNjpgeaF5FGEdpHlXeuZ2TwySinnKXF6/ttpew0Bl+w+7nMiKZCvyAgO9h/TUYFRO+TN/5qXNuyFsSBULMDnvDhumC0FstPLSf2kzeXVN9PyjpGirOginug+XhT1kOd2JOryU6e0xBmZcQJnbNhCuNbsxqFrIcZ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130265; c=relaxed/simple;
	bh=9Bn4NjrP625WXlMB3GLx/GV4tVt3hWa4qNhEPMNbaxQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=agdwtCFxuiW7egpf8Kn6oZbaakM6xSSbvKRdoBXzSQzwr8VQZeu76qFKBXlKV/cCvgpwAIAubTjyfjy4b/Vcn8TJVozQstleN2qEJ9kfCZIFm2Z96gaEoMiU5ewaRSAyAwS8dFwXfN/3pF2TLapr6DDQt5AOHUs9IixO/kP8tmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bm7R4Z0s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bm7R4Z0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BAA1F000E9;
	Sun, 30 Aug 2026 22:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788130264;
	bh=9Bn4NjrP625WXlMB3GLx/GV4tVt3hWa4qNhEPMNbaxQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bm7R4Z0sJ7wcKIWv4xEflrYT15lytt53awexMkM3rDJ+TVs9qNiVR7e64IVPESsFr
	 WMRMQtBeZUDaXGijY4Ape1x0OWjbOYbjU3pIxQrEgZKlHLIwnO2s1KegqlQHPw7E2e
	 UyspbkoUw0W/7IluU1jm1uf/fWK6cXl34YzI/DMJMqKIlFEgHO65sUqdaTsg6YOaci
	 cCTw3+tv2Cd5ncWczWU5BvNsKLemGQEB5Z2JsaghQMjEU79Ib32+VcgtcvoJS1vJuG
	 LtXtceJ3t1i+N6EViPHwysY79q4rpsBzZ9MrgwBYaa6a9X32SVTOUNlX7qyy+bsDmS
	 4vQpMvai4WQ/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/13] regulator: ab8500: Propagate mode enable read
 errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-6-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-6-fe279fff5e18@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:51:03 +0000
Message-Id: <20260830225104.02BAA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> For regulators whose enable and mode share a state field, set_mode()
> first reads that field so changing the requested mode does not enable a
> disabled rail. A register read error is currently treated as true and
> the driver proceeds to write the new mode, potentially enabling a rail
> whose state is unknown.
>=20
> Return the read error without changing the register or cached mode.
>=20
> References: AB8500 User Manual, UM0836 Rev 3, p. 227;
> AB8505 User Manual, DM00046744 Rev 3, p. 237
>=20
> Fixes: 438e695b87e0 ("regulator: ab8500: Get rid of is_enabled from struc=
t ab8500_regulator_info")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ux500-dts-=
snowball-regulator-v1-0-fe279fff5e18@kernel.org?part=3D6

