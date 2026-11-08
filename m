Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122726;
	b=yJ4RgQSM0dMU90IhQMaa1EFQNFs6vEmja+CXKECkTLzOi/FYYPO5lJh7FVJQn4wd0KKY
	 3xADPEg7DAmXBUvFlZ1lo769Sja5h51r7FEfqRRmWXxbXgZ7R7MH/TIYkI1aXyCh1pqzF
	 mwflZ/dlBlH2CxKU+lYKDKBG42r8qY7mV12ZVp9PcvcyUOAhgq7/K3DBTBnevCcTohviV
	 y1sCOPEXJQFu/d9qKrBAUSy/8FlUOGiOQxV3Pcxena9mSS1D9xVXVb8R56HmFk5KwCrGQ
	 Te5P2pSRPOAZOV0U4vHXdA4zeHZTRzwSjjKhYtbmNdvN12wbmuZJ6bG95MWsDimQGfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122726;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=m0xhrrawWvDQ0eIaAW3TtlXFt5eAGgWv8xs+n28MT5I=;
	b=DIR9mmJKi2LqyU6YkBGRQTRqFyz2MTOc4lsrLOdiV3P4DF+/fGlx9siPdTkJBKlOQVe+
	 +po2M8AI5jf+SG31wjxbod/uq9171aWqm8o31S+UFoluQ6PPibX7hunmWbY9xkbWR2bzj
	 rk9XecvfwqmAWbRraQPjKUPYQoLTa5GzjVmwtiw5WXW/6CJGgBXz8rzEAxBqm0FpE7dJO
	 CIaZ++2myaflfk0Ee1qv3TweoxYVqOyeqBAz8jvJWJZSIKNTnFomPTvptRWJgskmLV9iV
	 oqrjHkb1HE3jeapx/mtO+Oc+CnlZ/ozEN2q6d18usUr8sufpyZRqWOUyJJUm4Qu72jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15C6606D80E
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 07:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C15C6606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jMkw36Fl5z8Xrnw;
	Sun, 08 Nov 2026 15:25:23 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 6A87PI8t078862;
	Sun, 8 Nov 2026 15:25:18 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 8 Nov 2026 15:25:19 +0800 (CST)
X-Zmail-TransId: 2afa6af023dfa07-6e0cf
X-Mailer: Zmail v1.0
Message-ID: <20261108152519529TBI2L87EqbkTqOeCVnNWe@zte.com.cn>
In-Reply-To: <sashiko-outbox-203614@kernel.org>
References: 20261108151125513PyebyF3QC3r_DTxS9ZMf6@zte.com.cn,sashiko-outbox-203614@kernel.org
Date: Sun, 8 Nov 2026 15:25:19 +0800 (CST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <mfd@lists.linux.dev>
Cc: <lee@kernel.org>, <sashiko-bot@kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2Ml0gbWZkOiBnYXRld29ya3MtZ3NjOiBQcm9wYWdhdGUgSTJDIHJlYWQgZXJyb3Jz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A87PI8t078862
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sun, 08 Nov 2026 15:25:23 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF023E3.000/4jMkw36Fl5z8Xrnw

> This isn't a bug, but the commit message refers to the two GSC_FW_CRC
> checks in gsc_probe() as "added by the previous version" (v1 of the
> patch on the mailing list).  Since v2 replaces v1 and adds those
> GSC_FW_CRC error checks in this commit itself, could the commit message
> be updated to state that this patch adds the GSC_FW_CRC checks as well
> as propagating errors from gsc_read()?

Agreed, and thanks for catching it.  The sentence only makes sense with
v1 at hand; in v2 the gsc_read() fix and the two GSC_FW_CRC checks are
both part of this commit.  The second paragraph's "the existing FW_VER
check and the two CRC checks" has the same problem, since the CRC checks
are new here.

The code is unchanged, so I would rather not post a v3 just to reword
the message while the review is still open.  If the patch needs another
revision, the commit message will read:

  gsc_read() retries the I2C transfer but then stores "ret & 0xff" in
  *val and returns 0 even when the transfer failed.  regmap_read()
  therefore never reports an error, so the FW_VER check in gsc_probe()
  and the two GSC_FW_CRC checks that this patch adds are dead code, and
  on a failed read the firmware revision is built from the low byte of
  the negative errno.

  Return the error from gsc_read() before touching *val, so regmap_read()
  and its callers see the failure; the FW_VER check and the two CRC
  checks then work as intended.

If a fresh revision is preferred now, I'll repost with the wording fixed.
