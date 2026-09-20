Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED87A35C19B;
	Sun, 20 Sep 2026 05:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789883673; cv=none; b=poCC5A5c8rTOQlKrxBUNKi/VlzPSAWzN33tMXky7Yop6kYW16KFNWwVa2R044hZ+tEqIwyyq2WJSD8zcUaRYeEjxAg1jNpaoXnxNK6zxlUdO5hihDAhLG41UH9PANzlMSlAvBC8HQqV1F0VQghWX/awZbG7WTaKoU6KnqK3MHM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789883673; c=relaxed/simple;
	bh=so5wOo52EZzLRNAekkIumlha0vlg5X3ViGU2vsMfpcs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J1AGQ76chkHe4F8OYvk8O8GAx8leoDSh70muRNLD6HEbKMaxCcJCDQUdq1mrl+C0xYJO0khWZNXr02tcqUY5Wp0WZ2nEF8BIEsMAQqgWV4dPivV2afwMW3aL9daS68OlR6CQa3LlWzMlBx2h9ZO1NW/W+unbuMGz/Ewz4R7cV9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQYhD6ot; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQYhD6ot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A76D1F000FF;
	Sun, 20 Sep 2026 05:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789883672;
	bh=so5wOo52EZzLRNAekkIumlha0vlg5X3ViGU2vsMfpcs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PQYhD6otZIzJCQYjlpQHzxcOkoH75EbYaboOe+GVxTsqBRL8un9CRcmzbM67+jOlP
	 3rJZGkmUgCZ4O57vxpXnOBlRzzrToByRlm71BM7sFzvKgj2/XIgj+5o6ELQLTMQRIg
	 nBfqKDwGziaMJrzYkXfWlEhrB6iJBZ3tKxz+PTIuogJi4qepfZUlEVVagK5j/u/I1j
	 oelCsjaIh9fU1+uisJmbKDYVLbLPxn/aQ5M7kixfCJBlBCZ2CAjRc9DbBZidVf5CjF
	 wQup8G0dDQrMiUnd/3D8b9sv+SxrBahp3lfK0aD80FYxQwtTszZ2UApWMFbe+UP17G
	 jTwzNE/vUp0dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-3-c00edacbee64@gmail.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
 <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-3-c00edacbee64@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:54:31 +0000
Message-Id: <20260920055432.1A76D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
> devices array to allow the corresponding driver to probe using compatible
> string.
>=20
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-rbrue-suez=
-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com?part=3D3

