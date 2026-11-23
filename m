Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795402884;
	b=Af0ZVrPWtOJztMjOIFfFfCL3ZCvqCDGb+T1F+xwFBo4iuJgXUePnzY+wyFOuScRLANnj
	 Q5lNlP9+CXoaaN++Wk8B3nQKB5O/vGb0DnKu0viQukJooXE2t1a17NWwWzUrYOaiLNdfS
	 ibvelCRbh7PGA7V9mF2kiteOoDMS6IHFkHinrRSK3dKzpWDouUGuEClpMNe/qKPFP6+Fz
	 A6Lq7NnpNQJ2izEC3inXme0rtz/SQE5cVvaJbgSiR6y63sELhJGXPjzrY7BwtmW/9h3a1
	 ZGgnwqvXZbUh40wlshzdLGXdUOdmyaqWypNKhXId1ue4yBJodEaP/VK+QPEITeLRJhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795402884;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D8O+YZ7geHUioOfRz7r3O1SenNYmei/5V7Pdoaj2fz8=;
	b=nHGwmcGdxhHUeQYJB6I2ZmF3aVqJunta+32lYdrsrHkFxXzbKb9n2hjltexin+nTXPiv
	 3pzEu6dDjy5Ru5yX12sFUqoYH6iAQqeVwiGk5im50fml3fL5YSmBz9+uHkyrpjzdeYmSY
	 znhIRVwpIeJBgx6p9GQgKyCKCT8RdJCa+DBVQlbMp3Wv9uWm3UYo7/n8BAD56ex01t0aj
	 tiRMSyCnektLoG/dJUvPePxm0ZDJ+CP5Mlc3o8axf6qm81DsKfLFlu5gPeey4+/VFj3eE
	 6hRaecKukLWfneVdV8NMvXAcPPLUQLe/lk1ocOsy8JcMTC5wMzntG01BgAxqmHoLRbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=mMDFJLoa;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28DE606A31E;
	Mon, 23 Nov 2026 03:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D28DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=mMDFJLoa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=mMDFJLoaoyT25HS7Qk1IKlsW/D4xB1plgL8OhDwWu8WpyBf5coGOyOLSbFRZxdygn+IA/+tubnrc5
	 6uaN6T+lFsBbyCeDBM0LtjMqtdsUT9PyDEBqOx2F5T/hIzo7e27CNMAYXU7Ihq+L/xlKPVmNhjZ4mm
	 R1tylPk3KwlfC6zM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66b03ac7e8fc-04d75;
	Mon, 23 Nov 2026 11:01:20 +0800 (CST)
X-RM-TRANSID:2ee66b03ac7e8fc-04d75
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b03ac7e1c3-ec53c;
	Mon, 23 Nov 2026 11:01:20 +0800 (CST)
X-RM-TRANSID:2ee86b03ac7e1c3-ec53c
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: tzungbi@kernel.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	bleung@chromium.org,
	lee@kernel.org,
	groeck@chromium.org,
	jthies@google.com,
	chrome-platform@lists.linux.dev,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: cros_ec: Drop OF node reference in ec_device_probe()
Date: Mon, 23 Nov 2026 11:01:20 +0800
Message-ID: <20261123030120.1799-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <awOfCgL-eriqrws7@google.com>
References: <awOfCgL-eriqrws7@google.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tzung-Bi,

Thanks for the review of "[PATCH v2] mfd: cros_ec: Drop OF node
reference in ec_device_probe()"
(https://lore.kernel.org/all/20261118062949.1250-1-laixiangwu@cmss.chinamobile.com/).

Both comments are addressed in v3
(https://lore.kernel.org/all/20261123025022.1761-1-laixiangwu@cmss.chinamobile.com/):

> __free() is defined in <linux/cleanup.h>.  Please include it in the file.
>
> Alternatively, simply calling `of_node_put()` after using `np` also works.

v3 adds the missing #include <linux/cleanup.h>.  I kept the
__free(device_node) approach since it avoids explicit cleanup on every
exit path of the block.

> CHECK: Alignment should match open parenthesis
> #61: FILE: drivers/mfd/cros_ec_dev.c:280:
> +                       retval = mfd_add_hotplug_devices(ec->dev,
> +                                                         cros_ec_ucsi_cells,
> +                                                         ARRAY_SIZE(cros_ec_ucsi_cells));

Fixed in v3: the continuation lines were indented one column too far;
they now line up with the first argument of the call.

Best regards,
Xiangwu Lai


