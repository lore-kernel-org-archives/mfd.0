Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D91A3612F3;
	Thu, 17 Sep 2026 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632457; cv=none; b=qRUx493SqcYUqS/x1nzLUhhyRhKaQMweiHKm+IMrvmn3c1W5sXv757GsQMRqOYxWs+EFtdihS+TWMwxxT1IR4Hz1DKBYqFfFG1zh6EPadu73OzpKzDAl209LJdv3Tm0LmHs/AlcngfjNm2SKDp24Q9U/ldRHzSmxzk4peQBvwJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632457; c=relaxed/simple;
	bh=RbbGft3V8Igjyap2JJgMjhfd1vsG/7Rr8CPDW2yMTlI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RQaogFhuPve/YiXWsYrD8i5iWy1bjQG18O59gG2okoLnxsa9Q18kBKbXqxzfI7hcESyns4pefTbrOuZrAyFKjhTcRrbAHEOQVB/sLAf5JZsZwdtFNm/Ut0cqJVYMiAUc2JFhvStjI7+lfxPFiyc/TqL/EJaMPSP/Ke4n4VTFi3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXmOz+MO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXmOz+MO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971BF1F000FF;
	Thu, 17 Sep 2026 08:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632456;
	bh=RbbGft3V8Igjyap2JJgMjhfd1vsG/7Rr8CPDW2yMTlI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FXmOz+MOXp/utC8cN0kFwUYafNgg7gVgjvc6WeDYIUpG2CmqCsAxTwALWKa2Mh9i5
	 RQuZEFmw1sJloFN+m/ICzWNUs+jRB46SxkCCxYmZiULuWMSfQIqmpJMrFISIo3Ku6A
	 7o+6KWC4wltV+iWrdS4VE1AZrcII8pjLi/JMkljD7SE8h1/pVux1fK3k7/Cdm86mXx
	 Ze7aWQoGJVUVx2S+pBkxRCZ0r1XLdoZvr7SpNIdRO1EOJncu05NzOj+UJjZ7oq8BKR
	 RUkfoYwpbYezYssh/0x7wuErEn9nu8MKeKp3Wcyzgat7k8DzNmLEmuh6T4FLIusTBo
	 v1mQbJQXDdhxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/6] mfd: khadas-mcu: Use MFD_CELL_* macros for cell
 declarations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: lee@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-2-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-2-497cd543a148@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 08:07:35 +0000
Message-Id: <20260917080735.971BF1F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-add-mcu-fa=
n-khadas-vim4-v12-0-497cd543a148@aliel.fr?part=3D2

