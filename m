Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F26F49C4CE;
	Tue,  1 Sep 2026 20:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293725; cv=none; b=m0ea+jmSmKnq/ePqQZ8aK8U4Gc9M8AQtncmqRRVEQDyyMiI4JM62YAc/6ztTlxB3yP0q83XhcEGpPLfsNUmtqzbh1WMIABFNs6XfpubAN+hCt9HzlW5RqLerX4zAB5jpOU7iyu+G6GQxMkzBdCVS7aTWPvkcP/16dyf5UscLmXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293725; c=relaxed/simple;
	bh=i84n3b/rZBHzzFBc9Mdrh+IMMthaIb4jc2cGt3M7wR4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H1rNffk5aym+rSwCbobah9JhH1uaxb+G43xDtJHVzeuEngxVvf3TCoDC3bJc33UaaHlwK2Fcnv6JzyG7UVVsizyRnPDG/p+UJHV4C+w3eF5P4bsgS1JqDqjqYJi7OxSHQOmFaUsJ4JoiLzMWgyuxzByUjYI02FP+tkd+kQ6rZ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FN7A/pt7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FN7A/pt7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11FE1F000E9;
	Tue,  1 Sep 2026 20:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293724;
	bh=i84n3b/rZBHzzFBc9Mdrh+IMMthaIb4jc2cGt3M7wR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FN7A/pt7BPm3eknd5G8eWUEqGhdIJzRYb1o1i0lmcb4DO36vQMxS8dY0++akT4BcT
	 9H3oIm3SjHgxeXtZ/LCpg6aZxNoH7yDlotZqm8U/KqjkbBPMOf8Cc6ImSuIQQ+YkMW
	 pHPZc26t+cVb1MZLXh4BguRT9b5+tOPLbFAg8m6x2Mv0R9uBCZ7+igBliW77c8JINL
	 /+J95MXFj84NgRnlS0NhxniZF+caet9CIxk/D+EHZ563LSPJPagTwIqL+aw5r9yw6+
	 CW1EeNXDcxd5nNtN1V4bKYOrM8V1b0NAMQoTqtxmZpFJBP+j8tjn7DhXHJdCD2ZCut
	 VhfMPEJ+6hTIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/13] regulator: ab8500: Handle AB8505 VINTCORE
 selector 7
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-3-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-3-fe88b01829bf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:15:23 +0000
Message-Id: <20260901201523.F11FE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The AB8505 VINTCORE table exposes only selectors 0 through 6. The
> hardware also accepts selector 7 and maps it to 1.35 V, just like
> selector 6. Omitting it can make an OTP-programmed selector 7 appear
> invalid to the regulator core.
>=20
> Give AB8505 its own eight-entry selector table while leaving the
> AB8500 table unchanged.
>=20
> Reference: AB8505 User Manual, DM00046744 Rev 3, p. 223
>=20
> Fixes: 547f384f33db ("regulator: ab8500: add support for ab8505")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ux500-dts-=
snowball-regulator-v2-0-fe88b01829bf@kernel.org?part=3D3

