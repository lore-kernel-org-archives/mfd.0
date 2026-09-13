Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B591A682F
	for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 21:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789335751; cv=none; b=ccuKXxqEUw/yh/+wc6sC7alZqVWyJaiJLSrqVCejvrkAlULtw4XT1+Hru3L0fodvRNt2+2jtgXaSuq7ZgiXUbESXSR6pEAL7NnFOe51P/dJ1wmE9voMfJfPzAL5oOTx62MmWCTSNR/7/e12Ogiem8MNS8r1uHzJAi37gHhmkiFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789335751; c=relaxed/simple;
	bh=wzjJ5PvfY0kMkfHQXcHwW+ObVQEsvGc9n8iFoGCNNlA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wf63gxuHIONwduVdvUuPeUIOAOypkB3LM9b+8n+KyimStgbF1KeiEhPDs+tdsxl7oCI1QPjXtrBdsa2fEhScUn9rKjpEtntq9nM+5y4bohnqnZ1ZlCkDjdOT/jBIQbPEvZUhQEEQaVUWRNFVFlWh1Sm5tHMlZOxoXsH0omDRC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goVWiqt4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="goVWiqt4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57E81F000FF;
	Sun, 13 Sep 2026 21:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789335750;
	bh=wzjJ5PvfY0kMkfHQXcHwW+ObVQEsvGc9n8iFoGCNNlA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=goVWiqt43hGp4hGqfA7hEx8wqa72tIWHxc/IkfDtQq1DX1WbNkXrv9f6jhJ2Na03B
	 CVUwXPg/UmkHkDomDkY83QqwKQv4lq7Q24a71NYcdZHL9E0tzGYI/Wby6Nb274snqt
	 b7lL6AUXrIWusyExiwWhmrUjjcYEbVxpFVeftxjCk6UgJ2hOxv8xjrsAjh8D9sqREF
	 bnxaIdsRODQ1SioyKZcZH7+tGIQuzCxnKIInC95bIcG6TiMZ5a8t4DuVB+UaM3A6N+
	 MaZTCVKD+Y3sQT3PbvMsFlsYbwInxjhNhUK+MlGRjhmpcu8jtLEOM8M7kF5mj9MUUg
	 q5NnTnzYrFyyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: max77705: Mark PASS2 revision as supported
Reply-To: sashiko-reviews@lists.linux.dev
To: chiffa <chiffathefoxx@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260914-max77705-pass2-supported-v1-1-a453f0b14b2a@gmail.com>
References: <20260914-max77705-pass2-supported-v1-1-a453f0b14b2a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 21:42:29 +0000
Message-Id: <20260913214229.D57E81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The existing driver takes a safe approach and only probes on tested
> MAX77705 revisions. The only tested revision at the time was
> PASS3. PASS2 chips are present in the Samsung Galaxy S10/S10+/S10e
> devices.
>=20
> Testing on the S10 and S10+ shows the driver operates correctly on
> PASS2: interrupts are registered and fire, bind and unbind release the
> I2C device cleanly, and the charger and fuel gauge report plausible
> values, charging the battery to the same voltage as the vendor kernel,
> haptic feedback works.
>=20
> Replace the single-revision equality test with a bitmask of supported
> revisions so that further revisions can be added as they are tested.
> A bitmask is fine here since the revision bitfield is only 3 bits wide
> (maximum value of 7) and is always AND'ed by MAX77705_REVISION_MASK
> before matching the revisions.
>=20
> Link: https://lore.kernel.org/all/20251023131732.GN475031@google.com/
> Signed-off-by: chiffa <chiffathefoxx@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-max77705-p=
ass2-supported-v1-1-a453f0b14b2a@gmail.com?part=3D1

