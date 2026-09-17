Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984BD3EFD17;
	Thu, 17 Sep 2026 08:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632497; cv=none; b=Ty8Yia1qTx5v3URu8mA89Xb729NfQ0MzaIEYG2p/xxaOE/cSxtluV3jPXRrouL0nOUgQKSCKGVpCrFV9YATzQG/YFkXy4XPuyJ6MnoRLHJQ2B6bjAZP8paDJ6C+3scq7MiRhEV/RM4EiQlOX00QVvzafYygSJifQl2W08zEKh1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632497; c=relaxed/simple;
	bh=wFl8cOBOThylEyLf927ohFdSpr+rudS5mT01A0J9STg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mio2KFbYXVkdnZnJ8oz+LOWBKCjzEqnrPXKa6opcWTq7BuTa306a4PP4LcVQH9M9eFma/cKkEGmKYTZR1w6ub2cE+1zXU4UFrgAFW8xI8cSzVaz+Il8TE9gydTuyZWtB1R1XAOy1NwJPDUn1b6HmKPVB2mvS1al/Q3723XF36t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVDcknN3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVDcknN3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC981F000FF;
	Thu, 17 Sep 2026 08:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632492;
	bh=wFl8cOBOThylEyLf927ohFdSpr+rudS5mT01A0J9STg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TVDcknN36SgLs8i01Y9CMgL+V45CMxPpl3+Nc4J4pVJr8fke63ta5N5H9MMKTKSTW
	 iimMlQwDp4vWOLMe/d2FO/3mlo7tTk2E1Ll4AlbsJbZOAAXnbhQA3hXs1L1AWel1tm
	 y/8sPcjnTRbPummVjEJ9rxT8WkM8QaGlPwtX0qjp80On9ON7R02Zn2S0VFGHgOxFkX
	 Lr6wxGvNEXtArhnUBKm5KupLW4ErigTxU5pa2GXO+vrFsDTolwwqO7BDuIhGHattwC
	 i8lNUuReUYxPLJCu6DnxVKtyEUJ0sDxBNrI779r8V0N3xyIEyXKM4sJnyUw475MLiT
	 vKlvHZ+aYb62A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 6/6] arm64: dts: amlogic: t7: khadas-vim4: Add i2c
 MCU fan node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-6-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-6-497cd543a148@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 08:08:11 +0000
Message-Id: <20260917080811.8EC981F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>=20
> Enable and configure i2c MCU node to get fan working on Khadas VIM4.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-add-mcu-fa=
n-khadas-vim4-v12-0-497cd543a148@aliel.fr?part=3D6

