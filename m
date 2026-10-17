Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15466175A64
	for <mfd@lists.linux.dev>; Sat, 17 Oct 2026 00:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792198194; cv=none; b=kFNQp1OtK2vAKP5GRQxM6gWk1Y9bVdUozoxnzXNiwGqc+cFtZUjoZLVgFar48lWtNU9q9Wk9TKg6IMP3KV6X6dGXcH/nUtXGH645UI7eLaejRmyM1b2uRwVUSwOBmVq+bIpp+UZUkh6JoGEUoNUgkhbFK0Dln/OLPJcEym29hYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792198194; c=relaxed/simple;
	bh=WTlqqr90ryel979cIQJasNbKt5D21wlBO6ASSXMWsog=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Cjh8cBrqslAkfG2/h9V/TAKV01Ao6hhnS0nREDVRYo4ml9qfGCgKb68Fiw5TIxcvUVrKuP1ClKuc527O6x8r1lqMZ1jeeHH6gZJI3A+EhB3lhA9FKa7GdABEEveN2lz64h7uJ8lgPbvP4J+DeGcT9xpNHE2wlqGlUgpsvG5yIr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwip3UpR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwip3UpR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB561F000C4;
	Sat, 17 Oct 2026 00:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792198193;
	bh=WTlqqr90ryel979cIQJasNbKt5D21wlBO6ASSXMWsog=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gwip3UpRQ3veMNK2Xh2jKzBSHgt9VaVlfIc5XlxM3im9C6cX7XXaQUZf/tzruADir
	 a8loLODhXxN9hqVdd6o0Qv5YdRjeiy9KZGS/0AoyhoMbIQ/YQPww2xlc7zXx5UNCX+
	 Ko0MyG1fVeU4nSxIKNvE5eD1i6YyzaKYTt/QmtgJiAP6qYWHH7od80uBbannf7JnN+
	 Xm+vwiFfGpuU+dOWVD18eoL6iIWs4iiylVSZtSpLdWNr7CerHyUikG6A6On3MJ6NnG
	 1Hoq7gMkoXSBvV3Hm/KQIg17MzRwRu34mtP8GFGR5q0pzx7E7cABVzUjxS4b2QP2Ua
	 RwyuOq7Htdz4Q==
Message-ID: <sashiko-outbox-175080@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] mfd: twl-core: Embed the twl_client array in
 twl_private
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261017004758.1256875-1-rosenp@gmail.com>
References: <20261017004758.1256875-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 00:49:53 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> At most four I2C slave addresses are ever used (TWL4030 class), so
> there is no need to allocate the twl_client array separately. Embed a
> fixed array of TWL_MAX_SLAVES entries in struct twl_private and drop the
> extra devm_kcalloc() and its error handling.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017004758.1256=
875-1-rosenp@gmail.com?part=3D1

