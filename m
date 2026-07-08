Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07AE434E3D
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509695; cv=none; b=RswM1fWyo1WFbVgsZCe6uCyktQrLGGnJTlpg5W9ZN1i3EeXVEVBT41En4ryMUERMLRiVW9WzamM1O1h/nrotwBpd55b7Ts+w5aceT0Il0hDGlVnP9RW8eEjg5lGDAodL+hqFa8cDPEUrr8n4w8L2b4XFiFCJgDXrYsVVAVjT2M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509695; c=relaxed/simple;
	bh=OQkajenRuZSDGpegfFInBCObTQfKg1higwde+ARVad8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u21kmo+ve2tLVapuHvzPdY3q5+my8IDyjMce03skrWsgdunuHco/C+4++WuQJyI0q9Qp9Sz6yWaQT8c22f7hKYx31CYhO/m5lf2R830vq0Zu8a6SRjp3P+2esaHdNPXiRKB8pmxjaCpqk2cc1T+Co8GVX47HK51B8zCs+BjerGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaswB2SG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaswB2SG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1C11F000E9;
	Wed,  8 Jul 2026 11:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783509694;
	bh=OQkajenRuZSDGpegfFInBCObTQfKg1higwde+ARVad8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PaswB2SGxjpcyCAaqLroQx9UGO9nMIAeSX5YppEA1CcPJQ2lvbescb1NXg5LMwd1W
	 DcMoOJVMn6Mw97ayySHnfnrl8kRB6cx/5qnXZIZpBi7kaFjA4/6ZkMqFEw2wQdfJsD
	 bU6OVtSrplX9++gUL3i14H6g7UXcGqOnoDVApiG8hljBr8+4EO0kPSwX7GNtbVUlSY
	 FlkFACjFoB9ncQ7NxTyTgVyL9SqcPlbkxnlxR4cXa3AOok9glhFxSGRZoOsYaJSf+u
	 NvfoUelRUmwvlaJwSQtjUEQn8zNwbo7lnc8aBlRd3cseGNpP7uGMk3SGuis5m7eDim
	 Lreo0FLa6L30A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/23] mfd: mt6360: Drop irrelevant __maybe_unused
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <f4ea197a16a6345018db79896ac9af4fa0567ac1.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <f4ea197a16a6345018db79896ac9af4fa0567ac1.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:21:33 +0000
Message-Id: <20260708112134.1D1C11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
> modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
> even if the driver is built-in. So mt6360_of_id[] is always used and the
> __maybe_unused marker serves no purpose and can be dropped.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D5

