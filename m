Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493917;
	b=MxLdr8ihxK91r/bYJZrjGC7bzDHjw6mSG8Hjw5cg8WKCVqAiGHEmyNLfCszxfATpMUBZ
	 kdKtmbQOcpS0hZHtypoDMoh4+Z1tv//JnS9hrbVTKI35sji6dQT6BibLKzPpgO43tjaJs
	 Kso0db6ldkJefB+I5MNH1p//ZGYyysNSrdd9B8iPISUutSde8KxQKhYQaO/GA5gQda2g8
	 pzasYDW0zxhvFTwkwdXyK/+Cb1G+KqHqULjzN9gpDuisD5WhvOOJ16pbeun25zH5vs5ob
	 UX7r6iccEkQTTWnVdNWQvjujWs/IWPuGtvhU9tVZQMC/P4ey3aknD+o0taAll1lbsag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493917;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ohhL2QkDkOQXiJfIA9ZjK70OR3iC+QjevJi/2dScfMM=;
	b=M9HXHwOWC9LIot1AwDWLk25K0omlH35zq0n1CEWnqxGQE+JfKev6qRrgABoMRjURVyUC
	 7B1AGq1vXp5XqyQn96ozyW/rlckVrbsFXW4/VguuhCv6rN0MEFY3N4uAonZnDPMpdBDqu
	 is0BDzarornBxVcwGVWCzFsHYpAXAcZ7m6NSILpFaHaZJYGep7myRJTWUwMA1vdDVg7Up
	 1qUEtaj7cjRjWAfOCBRXu94e2Q71k6JuJ/DIh4cWX8jeNzYbZ+b9o3madF7l5pXCJZI/l
	 58FtU7yCRF8MHvkIwXf5LK2CBA1SCZVFyjY8vDgE1GEdJzvWlUUIiOJlz9Zundy3SrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="j5q3/J4L";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26BA606A882
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 14:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j5q3/J4L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215D11F00A05;
	Thu, 12 Nov 2026 14:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794493917;
	bh=ohhL2QkDkOQXiJfIA9ZjK70OR3iC+QjevJi/2dScfMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j5q3/J4LsBHMaSXZPEY1Q+zuXKxCopg16KE+aUlm4r3uu+fClNVbCI+Aw0P+BK7Em
	 6g3Yq9m/0c9WIu7GwC9c0/oqoDLExpJGvxhfvglmDaT48BAX99kwzeDRCfUdemnS85
	 nx92paNb2JQoQsLuxNW5yf0EYyPtEVrGOmHqYXWwjsAPQAcJ1+HHgUINkmlkyqEbF7
	 9d/ABaNxybxrjrP2MCl4ik2KDRheFwKqPx2MMY6sR7y+g1Q5mp5c3Jj+pNWq9q0EoW
	 tQ/v3d2S018Mf175DndNs5LEBP+9SYSUxPR9u8p8aqnwCbVTsJLc4nNMN+0DH+tocV
	 dwFbXU73TSHOw==
Message-ID: <sashiko-outbox-211329@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] mfd: cs42l43: Add load detection register needed
 for cs42l43b
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261112141650.1931348-2-ckeepax@opensource.cirrus.com>
References: <20261112141650.1931348-1-ckeepax@opensource.cirrus.com>
 <20261112141650.1931348-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 14:31:55 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The headphone load detection procedure on cs42l43b is slightly different
> and require a register that wasn't used on previous versions of the
> chip. Add that register into the driver.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112141650.1931=
348-1-ckeepax@opensource.cirrus.com?part=3D1

