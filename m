Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C6B477295;
	Fri,  2 Oct 2026 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932481; cv=none; b=ueQmVlMW5MbhKPVZZ1wUpButQPrrdcVK5TeEI3+QRTPQ3MQNHsQi58qoFe4g7eCCa6DljrnfxJPNnUJNI2raqtryt705ScghvreNwaI57ND3OosPdjdjvg8BEy99HSUoSWI+Ju6dUMsHaOt94UKKGsJAMdJe7vFtoJpR7lIYrxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932481; c=relaxed/simple;
	bh=i/Nk2XE6/d3QDDUPyvLx9kRV2lQIjOvsfWZzhvcAdnI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LbcNIIyDPNNJ1RSzAizw/oT/qvDDKwppw6IMyl6W3s7xc9oH1Sfc6FdbDhU6vmt7NfZ6X6jMfoIURgbxA7EANWDJDyAOW6lMsx3qfIUZs+7ZIu8tOcmh/6NpLcscTfTRWS3X8iVd/b0MrEArGP9M8j4G0U8lMDKMoIQfDqd1xBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bAD/66Vq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bAD/66Vq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3053B1F000FF;
	Fri,  2 Oct 2026 09:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932480;
	bh=i/Nk2XE6/d3QDDUPyvLx9kRV2lQIjOvsfWZzhvcAdnI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bAD/66VqaQLR9fIxxaeKzyWJIzVAV96ZOAkNI7ksc9uFiEvgTXCp04H9GrOSSSQHe
	 JQILBD4nG2bg9bOtscMzSEIioBLoLtr1SFBQjlzSCvY7gaMLgnWzuF9VY/hM4G+wIA
	 hZ0D3JBa8AkiCgj5XmUwmNr7dXpHc6CUeGep1zS2RMU4V+WLjbIubml9CDnWBN4rTP
	 mMoOCjTo6gyS+PStbZ7VvokkXKE0QRHEzX63dZTct7GNYcFyZtSTgfPBK+iimEE+E9
	 9BNW38oXU6Fv0Ef80Vd3T7GZI5BQSvEcuk+5DEVXGA9de5WbNzaH1CcXJjE3bEpZu0
	 agBJ/QVxHYLRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: ASoC: nvidia,tegra30-ahub: Convert
 to json-schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261002-as3722-bindings-v3-2-21c179b72a95@nvidia.com>
References: <20261002-as3722-bindings-v3-0-21c179b72a95@nvidia.com>
 <20261002-as3722-bindings-v3-2-21c179b72a95@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:39 +0000
Message-Id: <20261002091440.3053B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Thierry Reding <treding@nvidia.com>
>=20
> Convert Tegra AHUB bindings from the free-form text format to
> json-schema.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-as3722-bin=
dings-v3-0-21c179b72a95@nvidia.com?part=3D2

